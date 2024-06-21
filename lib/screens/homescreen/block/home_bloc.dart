import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_application_block/models/education_model.dart';
import 'package:job_application_block/models/formdata_model.dart';
import 'package:job_application_block/models/reference_model.dart';
import 'package:job_application_block/models/work_experience_model.dart';
import 'package:job_application_block/screens/homescreen/block/home_event.dart';
import 'package:job_application_block/screens/homescreen/block/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  TextEditingController languageController = TextEditingController();

  HomeBloc() : super(HomeInitialState(formDataModel: FormDataModel(), selectedForm: 0)) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeInitialState(formDataModel: FormDataModel(), selectedForm: 0));
    });

    on<HomeChangePageEvent>(homeChangePageEvent);
    on<HomeChangeGenderEvent>(homeChangeGenderEvent);
    on<HomeAddEducationEvent>(homeAddEducationEvent);
    on<HomeRemoveEducationEvent>(homeRemoveEducationEvent);
    on<HomeAddReferenceEvent>(homeAddReferenceEvent);
    on<HomeAddLanguageEvent>(homeAddLanguageEvent);
    on<HomeLanguageCheckboxEvent>(homeLanguageCheckboxEvent);
    on<HomeAddWorkExperienceEvent>(homeAddWorkExperienceEvent);
    on<HomeRemoveWorkExperienceEvent>(homeRemoveWorkExperienceEvent);
  }

  FutureOr<void> homeChangePageEvent(HomeChangePageEvent event, Emitter<HomeState> emit) {
    emit(HomeInitialState(
      formDataModel: state.formDataModel,
      selectedForm: event.selectedPage,
    ));
  }

  FutureOr<void> homeChangeGenderEvent(HomeChangeGenderEvent event, Emitter<HomeState> emit) {
    state.formDataModel.basicDetailModel.radioGenderValue = event.radioGenderValue;
    state.formDataModel.basicDetailModel.grpId = event.grpid;

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }

  FutureOr<void> homeChangeGenderEventEducation(HomeChangeGenderEvent event, Emitter<HomeState> emit) {
    state.formDataModel.technologyYouKnow.checkbox[0].data[0].name = event.radioGenderValue;

    state.formDataModel.technologyYouKnow.checkbox[0].data[0].index = event.grpid;

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }

  FutureOr<void> homeAddEducationEvent(HomeAddEducationEvent event, Emitter<HomeState> emit) {
    state.formDataModel.educationModel.educationModelList.add(EducationModelList());

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }

  FutureOr<void> homeAddWorkExperienceEvent(HomeAddWorkExperienceEvent event, Emitter<HomeState> emit) {
    state.formDataModel.workExperienceList.data.add(WorkExperience());

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }

  FutureOr<void> homeRemoveEducationEvent(HomeRemoveEducationEvent event, Emitter<HomeState> emit) {
    state.formDataModel.educationModel.educationModelList.removeAt(event.index);

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }

  FutureOr<void> homeRemoveWorkExperienceEvent(HomeRemoveWorkExperienceEvent event, Emitter<HomeState> emit) {
    state.formDataModel.workExperienceList.data.removeAt(event.index);

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }

  FutureOr<void> homeAddReferenceEvent(HomeAddReferenceEvent event, Emitter<HomeState> emit) {
    state.formDataModel.referenceModelList.data.add(ReferenceModel());

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }

  FutureOr<void> homeAddLanguageEvent(HomeAddLanguageEvent event, Emitter<HomeState> emit) {
    state.formDataModel.languageModel.language.add(languageController.text.trim());
    languageController.clear();
    state.formDataModel.languageModel.val.add(state.formDataModel.languageModel.data);
    state.formDataModel.languageModel.newLanguage.clear();

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }

  FutureOr<void> homeLanguageCheckboxEvent(HomeLanguageCheckboxEvent event, Emitter<HomeState> emit) {
    state.formDataModel.languageModel.val[event.index][event.key] = event.value;

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }
}
