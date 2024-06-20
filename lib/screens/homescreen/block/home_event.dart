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

class HomeAddEducationEvent extends HomeEvent {}
