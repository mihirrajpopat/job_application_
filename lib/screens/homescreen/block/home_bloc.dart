import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_application_block/models/basic_detail_model.dart';
import 'package:job_application_block/models/education_model.dart';
import 'package:job_application_block/models/formdata_model.dart';
import 'package:job_application_block/screens/homescreen/block/home_event.dart';
import 'package:job_application_block/screens/homescreen/block/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState(formDataModel: FormDataModel(), selectedForm: 0)) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeInitialState(formDataModel: FormDataModel(), selectedForm: 0));
    });

    on<HomeChangePageEvent>(homeChangePageEvent);
    on<HomeChangeGenderEvent>(homeChangeGenderEvent);
    on<HomeAddEducationEvent>(homeAddEducationEvent);
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

  FutureOr<void> homeAddEducationEvent(HomeAddEducationEvent event, Emitter<HomeState> emit) {
    state.formDataModel.educationModel.educationModelList.add(EducationModelList());

    emit(HomeInitialState(formDataModel: state.formDataModel, selectedForm: state.selectedForm));
  }
}
