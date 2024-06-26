import 'package:job_application_block/models/basic_detail_model.dart';

import '../../../models/formdata_model.dart';
import '../../../models/user.dart';

abstract class HomeState {
  FormDataModel formDataModel;
  List<Map<String, dynamic>> listingData;

  int selectedForm;

  HomeState({required this.formDataModel, required this.selectedForm, required this.listingData});
}

class HomeInitialState extends HomeState {
  HomeInitialState({required super.formDataModel, required super.selectedForm, required super.listingData});
}

// class HomeLoadingState extends HomeState {
//   HomeLoadingState();
// }
//
// class HomeLoadedState extends HomeState {
//   HomeLoadedState();
// }
//
// class HomeErrorState extends HomeState {
//   HomeErrorState();
// }
