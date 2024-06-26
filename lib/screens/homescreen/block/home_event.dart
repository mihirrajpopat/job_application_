abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  HomeInitialEvent();
}

class HomeChangePageEvent extends HomeEvent {
  int selectedPage;

  HomeChangePageEvent({required this.selectedPage});
}

class HomeListingEvent extends HomeEvent {
  HomeListingEvent();
}

class HomeEditEvent extends HomeEvent {
  int id;

  HomeEditEvent(this.id);
}

class HomeDeleteEvent extends HomeEvent {
  int index;

  HomeDeleteEvent(this.index);
}

class HomeAddCandidate extends HomeEvent {
  HomeAddCandidate();
}

class HomeChangeGenderEvent extends HomeEvent {
  String radioGenderValue;
  int grpid;

  HomeChangeGenderEvent({required this.radioGenderValue, required this.grpid});
}

class HomeChangeGenderEventEducation extends HomeEvent {
  String radioValue;
  int index;

  HomeChangeGenderEventEducation({required this.radioValue, required this.index});
}

class HomeAddEducationEvent extends HomeEvent {}

class HomeRemoveEducationEvent extends HomeEvent {
  int index;

  HomeRemoveEducationEvent({required this.index});
}

class HomeRemoveReferenceEvent extends HomeEvent {
  int index;

  HomeRemoveReferenceEvent({required this.index});
}

class HomeAddReferenceEvent extends HomeEvent {}

class HomeRemoveLanguageEvent extends HomeEvent {
  int index;

  HomeRemoveLanguageEvent({required this.index});
}

class HomeRemoveTechnologyEvent extends HomeEvent {
  int index;

  HomeRemoveTechnologyEvent({required this.index});
}

class HomeAddLanguageEvent extends HomeEvent {}

class HomeAddTechnologyEvent extends HomeEvent {}

class HomeAddWorkExperienceEvent extends HomeEvent {}

class HomeInsertData extends HomeEvent {}

class HomeUpdateData extends HomeEvent {}

class HomeRemoveWorkExperienceEvent extends HomeEvent {
  int index;

  HomeRemoveWorkExperienceEvent({required this.index});
}

class HomeLanguageCheckboxEvent extends HomeEvent {
  bool? value;
  int index;
  String valindex;

  HomeLanguageCheckboxEvent({required this.value, required this.index, required this.valindex});
}
