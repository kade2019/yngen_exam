part of 'diary_bloc.dart';

class DiaryState {
  final List<XFile> photos;
  final bool includeGallery;
  final String comments;
  final DateTime? date;
  final dynamic area;
  final dynamic taskCategory;
  final String tags;
  final bool linkExistingEvent;
  final dynamic event;

  const DiaryState({
    this.photos = const[],
    this.includeGallery = false,
    this.comments = "",
    this.date,
    this.area,
    this.taskCategory,
    this.tags = "",
    this.linkExistingEvent = false,
    this.event
  });

  DiaryState copyWith({
    List<XFile>? photos,
    bool? includeGallery,
    String? comments,
    DateTime? date,
    dynamic area,
    dynamic taskCategory,
    String? tags,
    bool? linkExistingEvent,
    dynamic event,
  }) {
    return DiaryState(
      photos: photos ?? this.photos,
      includeGallery: includeGallery ?? this.includeGallery,
      comments: comments ?? this.comments,
      date: date ?? this.date,
      area: area ?? this.area,
      taskCategory: taskCategory ?? this.taskCategory,
      tags: tags ?? this.tags,
      linkExistingEvent: linkExistingEvent ?? this.linkExistingEvent,
      event: event ?? this.event,
    );
  }
}

class DiaryInitial extends DiaryState {}

class DiarySubmitted extends DiaryState{}