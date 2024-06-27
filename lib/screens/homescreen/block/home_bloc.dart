import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_application_block/models/education_model.dart';
import 'package:job_application_block/models/formdata_model.dart';
import 'package:job_application_block/models/lanuage_model.dart';
import 'package:job_application_block/models/reference_model.dart';
import 'package:job_application_block/models/work_experience_model.dart';
import 'package:job_application_block/screens/homescreen/block/home_event.dart';
import 'package:job_application_block/screens/homescreen/block/home_state.dart';

import '../../../database/db_helper.dart';
import '../../../models/checkbox_item.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  DatabaseHelper db = DatabaseHelper.instance;
  TextEditingController languageController = TextEditingController();
  TextEditingController technologyController = TextEditingController();

  HomeBloc() : super(HomeInitialState(formDataModel: FormDataModel(), selectedForm: 0, listingData: [])) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeInitialState(formDataModel: FormDataModel(), selectedForm: 0, listingData: []));
    });

    on<HomeChangePageEvent>(homeChangePageEvent);
    on<HomeChangeGenderEvent>(homeChangeGenderEvent);
    on<HomeAddEducationEvent>(homeAddEducationEvent);
    on<HomeRemoveEducationEvent>(homeRemoveEducationEvent);
    on<HomeRemoveLanguageEvent>(homeRemoveLanguageEvent);
    on<HomeAddReferenceEvent>(homeAddReferenceEvent);
    on<HomeAddLanguageEvent>(homeAddLanguageEvent);
    on<HomeAddTechnologyEvent>(homeAddTechnologyEvent);
    on<HomeLanguageCheckboxEvent>(homeLanguageCheckboxEvent);
    on<HomeAddWorkExperienceEvent>(homeAddWorkExperienceEvent);
    on<HomeRemoveWorkExperienceEvent>(homeRemoveWorkExperienceEvent);
    on<HomeInsertData>(homeInsertData);
    on<HomeUpdateData>(homeUpdateData);
    on<HomeChangeGenderEventEducation>(homeChangeGenderEventEducation);
    on<HomeAddCandidate>(homeAddCandidate);
    on<HomeListingEvent>(homeListingEvent);
    on<HomeDeleteEvent>(homeDeleteEvent);
    on<HomeEditEvent>(homeEditEvent);
  }

  FutureOr<void> homeAddTechnologyEvent(HomeAddTechnologyEvent event, Emitter<HomeState> emit) {
    state.formDataModel.technologyModelList.data.add(
      TechnologyModel(techonologyName: technologyController.text),
    );

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  Future<FutureOr<void>> homeUpdateData(HomeUpdateData event, Emitter<HomeState> emit) async {
    for (int i = 0; i < state.formDataModel.lanuageListModel.deleted.length; i++) {
      await db.deleteData(state.formDataModel.lanuageListModel.deleted[i], "languageknown");
    }

    for (int i = 0; i < state.formDataModel.educationModel.deleted.length; i++) {
      await db.deleteData(state.formDataModel.educationModel.deleted[i], "educationDetails");
    }

    Map<String, dynamic> basicDetails = state.formDataModel.basicDetailModel.getBasicDetails();

    Map<String, dynamic> prefrenceData = state.formDataModel.preferedModel.getPreferenceData();

    List<Map<String, dynamic>> language = state.formDataModel.lanuageListModel.jsonLanuage();
    List<Map<String, dynamic>> referenceList = state.formDataModel.referenceModelList.jsonReference();

    List<Map<String, dynamic>> educationDetailList = state.formDataModel.educationModel.jsonEducation();

    List<Map<String, dynamic>> workDetailList = state.formDataModel.workExperienceList.jsonWork();

    for (int i = 0; i < workDetailList.length; i++) {
      if (workDetailList[i]['id'] == -1) {
        workDetailList[i].remove("id");
        workDetailList[i]['wid'] = state.formDataModel.basicDetailModel.id;

        await db.insertData(workDetailList[i], "workexperience");
        workDetailList[i]['id'] = -1;
      } else {
        await db.UpdateData(workDetailList[i], workDetailList[i]['id'], "workexperience");
      }
    }

    for (int i = 0; i < language.length; i++) {
      if (language[i]['id'] == -1) {
        language[i].remove("id");
        language[i]['lid'] = state.formDataModel.basicDetailModel.id;

        await db.insertData(language[i], "languageknown");
        language[i]['id'] = -1;
      } else {
        await db.UpdateData(language[i], language[i]['id'], "languageknown");
      }
    }

    for (int i = 0; i < referenceList.length; i++) {
      if (referenceList[i]['id'] == -1) {
        referenceList[i].remove("id");
        referenceList[i]['rid'] = state.formDataModel.basicDetailModel.id;

        await db.insertData(referenceList[i], "referenceDetails");
        referenceList[i]['id'] = -1;
      } else {
        await db.UpdateData(referenceList[i], referenceList[i]['id'], "referenceDetails");
      }
    }

    for (int i = 0; i < educationDetailList.length; i++) {
      if (educationDetailList[i]['id'] == -1) {
        educationDetailList[i].remove("id");
        educationDetailList[i]['eid'] = state.formDataModel.basicDetailModel.id;

        await db.insertData(educationDetailList[i], "educationDetails");
        educationDetailList[i]['id'] = -1;
      } else {
        await db.UpdateData(educationDetailList[i], educationDetailList[i]['id'], "educationDetails");
      }
    }

    int id = await db.UpdateData(basicDetails, state.formDataModel.basicDetailModel.id, "basicDetails");

    await db.UpdateData(prefrenceData, state.formDataModel.preferedModel.id, "preference");
    state.formDataModel.technologyModelList.data.add(
      TechnologyModel(techonologyName: technologyController.text),
    );

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeEditEvent(HomeEditEvent event, Emitter<HomeState> emit) async {
    List<List<Map<String, dynamic>>> result = await db.getDataById(event.id);

    FormDataModel formDataModel = FormDataModel();

    formDataModel.basicDetailModel.setBasicDetails(result[0]);

    formDataModel.preferedModel.setPreferenceData(result[1]);

    formDataModel.educationModel.setEducationData(result[2]);
    formDataModel.workExperienceList.setWorkExperienceDetails(result[3]);
    formDataModel.referenceModelList.setWorkExperienceDetails(result[4]);
    formDataModel.lanuageListModel.setLanguageData(result[5]);
    formDataModel.technologyModelList.setEducationData(result[6]);

    state.formDataModel = formDataModel;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeRemoveLanguageEvent(HomeRemoveLanguageEvent event, Emitter<HomeState> emit) async {
    state.formDataModel.lanuageListModel.data.removeAt(event.index);

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeDeleteEvent(HomeDeleteEvent event, Emitter<HomeState> emit) async {
    await db.deleteData(event.index, "basicDetails");
    List<Map<String, dynamic>> data = await db.getdata();

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: data));
  }

  FutureOr<void> homeListingEvent(HomeListingEvent event, Emitter<HomeState> emit) async {
    List<Map<String, dynamic>> data = await db.getdata();

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: data));
  }

  FutureOr<void> homeChangeGenderEventEducation(HomeChangeGenderEventEducation event, Emitter<HomeState> emit) {
    state.formDataModel.technologyModelList.data[event.index].know = event.radioValue;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeAddCandidate(HomeAddCandidate event, Emitter<HomeState> emit) {
    state.formDataModel = FormDataModel();
    state.selectedForm = 0;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  Future<FutureOr<void>> homeInsertData(HomeInsertData event, Emitter<HomeState> emit) async {
    print("hello");

    Map<String, dynamic> basicDetails = state.formDataModel.basicDetailModel.getBasicDetails();

    Map<String, dynamic> prefrenceData = state.formDataModel.preferedModel.getPreferenceData();

    List<Map<String, dynamic>> educationDetailList = state.formDataModel.educationModel.jsonEducation();

    List<Map<String, dynamic>> technology = state.formDataModel.technologyModelList.jsonEducation();

    List<Map<String, dynamic>> language = state.formDataModel.lanuageListModel.jsonLanuage();

    List<Map<String, dynamic>> workDetailList = state.formDataModel.workExperienceList.jsonWork();

    List<Map<String, dynamic>> referenceList = state.formDataModel.referenceModelList.jsonReference();

    int id = await db.insertData(basicDetails, "basicDetails");
    prefrenceData["pid"] = id;

    for (int i = 0; i < technology.length; i++) {
      technology[i].remove("id");

      technology[i]['tid'] = id;
      await db.insertData(technology[i], "technologyknown");

      technology[i]['id'] = -1;
    }
    for (int i = 0; i < educationDetailList.length; i++) {
      educationDetailList[i].remove("id");

      educationDetailList[i]['eid'] = id;
      await db.insertData(educationDetailList[i], "educationDetails");

      educationDetailList[i]['id'] = -1;
    }

    for (int i = 0; i < language.length; i++) {
      language[i].remove("id");

      language[i]['lid'] = id;
      await db.insertData(language[i], "languageknown");

      language[i]['id'] = -1;
    }

    for (int i = 0; i < referenceList.length; i++) {
      referenceList[i].remove("id");
      referenceList[i]['rid'] = id;
      await db.insertData(referenceList[i], "referenceDetails");
      referenceList[i]['id'] = -1;
    }

    for (int i = 0; i < workDetailList.length; i++) {
      workDetailList[i].remove("id");
      workDetailList[i]['wid'] = id;
      await db.insertData(workDetailList[i], "workexperience");

      workDetailList[i]['id'] = -1;
    }

    await db.insertData(prefrenceData, "preference");

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeChangePageEvent(HomeChangePageEvent event, Emitter<HomeState> emit) {
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
    state.formDataModel.lanuageListModel.data.add(LanguageModel(languageName: languageController.text));
    languageController.clear();

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }

  FutureOr<void> homeLanguageCheckboxEvent(HomeLanguageCheckboxEvent event, Emitter<HomeState> emit) {
    state.formDataModel.lanuageListModel.data[event.index].val[event.valindex] = event.value;

    emit(HomeInitialState(
        formDataModel: state.formDataModel, selectedForm: state.selectedForm, listingData: state.listingData));
  }
}
