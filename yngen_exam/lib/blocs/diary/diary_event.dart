part of 'diary_bloc.dart';

abstract class DiaryEvent {}

class AddPhotos extends DiaryEvent {
  final List<XFile> photos;
  AddPhotos({required this.photos});
}

class RemovePhoto extends DiaryEvent {
  final dynamic photo;
  RemovePhoto({required this.photo});
}

class SetIncludeGallery extends DiaryEvent {
  final bool includeGallery;
  SetIncludeGallery({required this.includeGallery});
}

class SetComments extends DiaryEvent {
  final String comments;
  SetComments({required this.comments});
}

class SetDate extends DiaryEvent {
  final DateTime date;
  SetDate({required this.date});
}

class SetArea extends DiaryEvent {
  final dynamic area;
  SetArea({required this.area});
}

class SetTaskCategory extends DiaryEvent {
  final dynamic taskCategory;
  SetTaskCategory({required this.taskCategory});
}

class SetTags extends DiaryEvent {
  final String tags;
  SetTags({required this.tags});
}

class SetLinkToExisting extends DiaryEvent {
  final bool linkExistingEvent;
  SetLinkToExisting({required this.linkExistingEvent});
}

class SetEvent extends DiaryEvent {
  final dynamic event;
  SetEvent({required this.event});
}

class Submit extends DiaryEvent {}