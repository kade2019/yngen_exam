import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:yngen_exam/utils/date_converter.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(DiaryInitial()) {
    on<DiaryEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddPhotos>((event, emit) {
      print(event.photos);
      print(state.photos);
      var photos = [...state.photos, ...event.photos];
      print(photos);
      emit(state.copyWith(photos: photos));
    });
    on<RemovePhoto>((event, emit) {
      var photos = state.photos;
      photos.remove(event.photo);
      print(photos);
      emit(state.copyWith(photos: photos));
    });
    on<SetIncludeGallery>((event, emit) {
      emit(state.copyWith(includeGallery: event.includeGallery));
    });
    on<SetComments>((event, emit) {
      emit(state.copyWith(comments: event.comments));
    });
    on<SetDate>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
    on<SetArea>((event, emit) {
      emit(state.copyWith(area: event.area));
    });
    on<SetTaskCategory>((event, emit) {
      emit(state.copyWith(taskCategory: event.taskCategory));
    });
    on<SetTags>((event, emit) {
      emit(state.copyWith(tags: event.tags));
    });
    on<SetLinkToExisting>((event, emit) {
      emit(state.copyWith(linkExistingEvent: event.linkExistingEvent));
    });
    on<SetEvent>((event, emit) {
      emit(state.copyWith(event: event.event));
    });
    on<Submit>((event, emit) async {

      var base64photos = state.photos.map((e) {
        File file = File(e.path);
        var bytes = file.readAsBytesSync();
        String img64 = base64Encode(bytes);
        return img64;
      }).toList();

      print(base64photos);

      var req = await http.post(Uri.parse("https://reqres.in"), body: jsonEncode({
        "photos": base64photos,
        "includeGallery": state.includeGallery,
        "comments": state.comments,
        "date": state.date != null ? DateConverter.dateToString(state.date!) : null,
        "area": state.area,
        "taskCategory": state.taskCategory,
        "tags": state.tags,
        "linkExistingEvent": state.linkExistingEvent,
        "event": state.event
      }));

      print(req.body);
      print(req.statusCode);

      emit(DiarySubmitted());

    });
  }
}
