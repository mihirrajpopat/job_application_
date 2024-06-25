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

import '../../../database/db_helper.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  TextEditingController languageController = TextEditingController();

  HomeBloc() : super(HomeInitialState(formDataModel: FormDataModel(), selectedForm: 8, listingData: [])) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeInitialState(formDataModel: FormDataModel(), selectedForm: 8, listingData: []));
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
    on<HomeChangeGenderEventEducation>(homeChangeGenderEventEducation);
    on<HomeAddCandidate>(homeAddCandidate);
    on<HomeListingEvent>(homeListingEvent);
    on<HomeDeleteEvent>(homeDeleteEvent);
    on<HomeEditEvent>(homeEditEvent);
  }

  FutureOr<void> homeEditEvent(HomeEditEvent event, Emitter<HomeState> emit) async {
    DatabaseHelper db = DatabaseHelper();

    List<List<Map<String, dynamic>>> result = await db.getDataById(event.id);

    FormDataModel formDataModel = FormDataModel();

    formDataModel.basicDetailModel.setBasicDetails(result[0]);

    formDataModel.preferedModel.setPreferenceData(result[1]);

    formDataModel.educationModel.setEducationData(result[2]);

    state.selectedForm = 7;
    state.formDataModel = formDataModel;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeDeleteEvent(HomeDeleteEvent event, Emitter<HomeState> emit) async {
    DatabaseHelper db = DatabaseHelper();
    await db.deleteData(event.index);
    List<Map<String, dynamic>> data = await db.getdata();

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: data));
  }

  FutureOr<void> homeListingEvent(HomeListingEvent event, Emitter<HomeState> emit) async {
    DatabaseHelper db = DatabaseHelper();
    List<Map<String, dynamic>> data = await db.getdata();

    print("listing data is ${data}");

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: data));
  }

  FutureOr<void> homeChangeGenderEventEducation(HomeChangeGenderEventEducation event, Emitter<HomeState> emit) {
    // print(" raio valur ${event.radioGenderValue}");

    state.formDataModel.technologyModelList.data[event.index].know = event.radioValue;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeAddCandidate(HomeAddCandidate event, Emitter<HomeState> emit) {
    // print(" raio valur ${event.radioGenderValue}");

    state.formDataModel = FormDataModel();
    state.selectedForm = 0;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeChangePageEvent(HomeChangePageEvent event, Emitter<HomeState> emit) {
    print("${event.selectedPage}");
    state.selectedForm = event.selectedPage;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeChangeGenderEvent(HomeChangeGenderEvent event, Emitter<HomeState> emit) {
    state.formDataModel.basicDetailModel.radioGenderValue = event.radioGenderValue;
    state.formDataModel.basicDetailModel.grpId = event.grpid;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeAddEducationEvent(HomeAddEducationEvent event, Emitter<HomeState> emit) {
    state.formDataModel.educationModel.educationModelList.add(EducationModelList());

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeAddWorkExperienceEvent(HomeAddWorkExperienceEvent event, Emitter<HomeState> emit) {
    state.formDataModel.workExperienceList.data.add(WorkExperience());

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeRemoveEducationEvent(HomeRemoveEducationEvent event, Emitter<HomeState> emit) {
    state.formDataModel.educationModel.educationModelList.removeAt(event.index);

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeRemoveWorkExperienceEvent(HomeRemoveWorkExperienceEvent event, Emitter<HomeState> emit) {
    state.formDataModel.workExperienceList.data.removeAt(event.index);

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeAddReferenceEvent(HomeAddReferenceEvent event, Emitter<HomeState> emit) {
    state.formDataModel.referenceModelList.data.add(ReferenceModel());

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeAddLanguageEvent(HomeAddLanguageEvent event, Emitter<HomeState> emit) {
    state.formDataModel.languageModel.language.add(languageController.text.trim());
    languageController.clear();
    state.formDataModel.languageModel.val.add(state.formDataModel.languageModel.data);
    state.formDataModel.languageModel.newLanguage.clear();

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeLanguageCheckboxEvent(HomeLanguageCheckboxEvent event, Emitter<HomeState> emit) {
    state.formDataModel.languageModel.val[event.index][event.key] = event.value;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }
}
