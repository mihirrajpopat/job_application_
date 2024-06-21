import 'package:job_application_block/models/prefered_model.dart';
import 'package:job_application_block/models/reference_model.dart';
import 'package:job_application_block/models/work_experience_model.dart';

import 'basic_detail_model.dart';
import 'checkbox_item.dart';
import 'education_model.dart';
import 'lanuage_model.dart';

class FormDataModel {
  BasicDetailModel basicDetailModel = BasicDetailModel();
  EducationModel educationModel = EducationModel();
  LanguageModel languageModel = LanguageModel();
  ReferenceModelList referenceModelList = ReferenceModelList();
  WorkExperienceList workExperienceList = WorkExperienceList();
  TechnologyYouKnowModel technologyYouKnow = TechnologyYouKnowModel();
  PreferedModel preferedModel = PreferedModel();
}
