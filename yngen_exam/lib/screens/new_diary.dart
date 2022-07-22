import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yngen_exam/blocs/diary/diary_bloc.dart';
import 'package:yngen_exam/utils/colors.dart';
import 'package:yngen_exam/utils/router.dart';
import 'package:yngen_exam/utils/screen.dart';
import 'package:yngen_exam/widgets/button.dart';
import 'package:yngen_exam/widgets/card.dart';
import 'package:yngen_exam/widgets/date_picker.dart';
import 'package:yngen_exam/widgets/input.dart';
import 'package:yngen_exam/widgets/alert_dialog.dart';
import 'package:yngen_exam/widgets/margin.dart';
import 'package:yngen_exam/widgets/select.dart';
import 'package:yngen_exam/widgets/texts.dart';
import 'dart:io';

class NewDiaryScreen extends StatefulWidget {
  const NewDiaryScreen({Key? key}) : super(key: key);

  @override
  State<NewDiaryScreen> createState() => _NewDiaryScreenState();
}

class _NewDiaryScreenState extends State<NewDiaryScreen> {

  DiaryBloc diaryBloc = DiaryBloc();
  String location = "";

  @override
  initState(){
    super.initState();
    findLocation();
  }

  findLocation() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks[0]);
    Placemark place = placemarks[0];
    setState(() {
      location = "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldText(
          "New Diary",
          color: Colors.white,
        ),
        leading: IconButton(
            onPressed: () {
              popRoute(context);
            },
            icon: Icon(Icons.close)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocListener<DiaryBloc, DiaryState>(
        bloc: diaryBloc,
        listener: (context, state) {
          if(state is DiarySubmitted){
            popRoute(context);
            showAlert(context, message: "Success");
          }
        },
        child: BlocBuilder<DiaryBloc, DiaryState>(
          bloc: diaryBloc,
          builder: (context, state) {
            return Container(
              width: Screen.width(context),
              height: Screen.height(context),
              color: Colors.lightBlue.withOpacity(.05),
              child: ListView(
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Row(children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey.shade600,
                      ),
                      Margin.h(),
                      if(location.isEmpty)
                      SizedBox(width: 10, height: 10, child: CircularProgressIndicator(color: mainColor, strokeWidth: 2,)),
                      if(location.isNotEmpty)
                      RegularText(
                        location,
                        size: 12,
                      )
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RegularText(
                              "Add to site diary",
                              size: 18,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                        MyCard(
                          title: "Add photos to site diary",
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Wrap(
                                children: [
                                  ...state.photos.map((e) => Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, right: 0),
                                            child: Image.file(
                                              File(e.path),
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                            margin: EdgeInsets.only(right: 10),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                                width: 25,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade600,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: GestureDetector(
                                                    onTap: () {
                                                      diaryBloc.add(RemovePhoto(
                                                          photo: e));
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                      size: 16,
                                                    ))),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            SolidButton(
                              event: () async {
                                final ImagePicker picker = ImagePicker();
                                final List<XFile>? images =
                                    await picker.pickMultiImage();
                                if (images != null) {
                                  diaryBloc.add(AddPhotos(photos: images));
                                }
                              },
                              color: mainColor,
                              child: SemiBoldText(
                                "Add a photo",
                                color: Colors.white,
                              ),
                            ),
                            Margin.v(size: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RegularText(
                                  "Include in photo gallery",
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                Checkbox(
                                    value: state.includeGallery,
                                    activeColor: mainColor,
                                    onChanged: (e) {
                                      print(e);
                                      diaryBloc.add(SetIncludeGallery(
                                          includeGallery: e!));
                                    })
                              ],
                            )
                          ],
                        ),
                        MyCard(
                          title: "Comments",
                          children: [
                            Input(
                              hint: "Comments",
                              onChange: (e) {
                                diaryBloc.add(SetComments(comments: e));
                              },
                            )
                          ],
                        ),
                        MyCard(
                          title: "Details",
                          children: [
                            MyDatePicker(
                              hint: "Select Date",
                              value: state.date,
                              onChange: (e) {
                                diaryBloc.add(SetDate(date: e));
                              },
                            ),
                            Margin.v(),
                            Select(
                              hint: "Area",
                              value: state.area,
                              options: [
                                SelectOptions(label: "Area 1", value: "area1"),
                                SelectOptions(label: "Area 2", value: "area2"),
                                SelectOptions(label: "Area 3", value: "area3")
                              ],
                              onChange: (e) {
                                diaryBloc.add(SetArea(area: e));
                              },
                            ),
                            Margin.v(),
                            Select(
                              hint: "Task Category",
                              value: state.taskCategory,
                              options: [
                                SelectOptions(
                                    label: "Task Category 1", value: "tc1"),
                                SelectOptions(
                                    label: "Task Category 2", value: "tc2"),
                                SelectOptions(
                                    label: "Task Category 3", value: "tc3")
                              ],
                              onChange: (e) {
                                diaryBloc.add(SetTaskCategory(taskCategory: e));
                              },
                            ),
                            Margin.v(),
                            Input(
                              hint: "Tags",
                              onChange: (e) {
                                diaryBloc.add(SetTags(tags: e));
                              },
                            )
                          ],
                        ),
                        MyCard(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SemiBoldText("Link to existing event?"),
                                Checkbox(
                                    activeColor: mainColor,
                                    value: state.linkExistingEvent,
                                    onChanged: (e) {
                                      diaryBloc.add(SetLinkToExisting(
                                          linkExistingEvent: e!));
                                    })
                              ],
                            ),
                            Select(
                              hint: "Select event",
                              value: state.event,
                              options: [
                                SelectOptions(
                                    label: "Event 1", value: "event1"),
                                SelectOptions(
                                    label: "Event 2", value: "event2"),
                                SelectOptions(
                                    label: "Event 3", value: "event3"),
                              ],
                              onChange: (e) {
                                diaryBloc.add(SetEvent(event: e));
                              },
                            )
                          ],
                        ),
                        Margin.v(size: 20),
                        SolidButton(
                            width: Screen.width(context),
                            child: SemiBoldText(
                              "Next",
                              color: Colors.white,
                            ),
                            event: () {
                              showLoader(context);
                              diaryBloc.add(Submit());
                            },
                            color: mainColor)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
