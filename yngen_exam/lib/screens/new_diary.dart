import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yngen_exam/utils/colors.dart';
import 'package:yngen_exam/utils/router.dart';
import 'package:yngen_exam/utils/screen.dart';
import 'package:yngen_exam/widgets/button.dart';
import 'package:yngen_exam/widgets/card.dart';
import 'package:yngen_exam/widgets/margin.dart';
import 'package:yngen_exam/widgets/texts.dart';

class NewDiaryScreen extends StatefulWidget {
  const NewDiaryScreen({Key? key}) : super(key: key);

  @override
  State<NewDiaryScreen> createState() => _NewDiaryScreenState();
}

class _NewDiaryScreenState extends State<NewDiaryScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RegularText(
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
      body: Container(
        width: Screen.width(context),
        height: Screen.height(context),
        color: Colors.lightBlue.withOpacity(.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                RegularText(
                  "20041075 | TAP-NS TAP-NORTH Strathfield",
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
                      RegularText("Add photos to site diary"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Wrap(),
                      ),
                      SolidButton(
                        event: () {},
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
                              value: isChecked,
                              activeColor: mainColor,
                              onChanged: (e) {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                  MyCard(
                    title: "Comments",
                    children: [],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
