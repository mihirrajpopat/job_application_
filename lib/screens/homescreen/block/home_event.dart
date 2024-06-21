import 'package:job_application_block/constants/strings.dart';

import '../../../models/user.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  HomeInitialEvent();
}

class HomeChangePageEvent extends HomeEvent {
  int selectedPage;

  HomeChangePageEvent({required this.selectedPage});
}

class HomeChangeGenderEvent extends HomeEvent {
  String radioGenderValue;
  int grpid;

  HomeChangeGenderEvent({required this.radioGenderValue, required this.grpid});
}

class HomeChangeGenderEventEducation extends HomeEvent {
  String radioGenderValue;
  int grpid;

  HomeChangeGenderEventEducation({required this.radioGenderValue, required this.grpid});
}

class HomeAddEducationEvent extends HomeEvent {}

class HomeRemoveEducationEvent extends HomeEvent {
  int index;

  HomeRemoveEducationEvent({required this.index});
}

class HomeAddReferenceEvent extends HomeEvent {}

class HomeAddLanguageEvent extends HomeEvent {}

class HomeAddWorkExperienceEvent extends HomeEvent {}

class HomeRemoveWorkExperienceEvent extends HomeEvent {
  int index;

  HomeRemoveWorkExperienceEvent({required this.index});
}

class HomeLanguageCheckboxEvent extends HomeEvent {
  bool value;
  String key;
  int index;

  HomeLanguageCheckboxEvent({
    required this.value,
    required this.index,
    required this.key,
  });
}
