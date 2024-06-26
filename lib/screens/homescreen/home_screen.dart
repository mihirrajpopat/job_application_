import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_application_block/lib/common_widgets/svg_image.dart';
import 'package:job_application_block/screens/homescreen/block/home_bloc.dart';
import 'package:job_application_block/screens/homescreen/block/home_event.dart';
import 'package:job_application_block/screens/homescreen/block/home_state.dart';
import 'package:job_application_block/screens/homescreen/subforms/basic_details.dart';
import 'package:job_application_block/screens/homescreen/subforms/education_datails.dart';
import 'package:job_application_block/screens/homescreen/subforms/language_known.dart';
import 'package:job_application_block/screens/homescreen/subforms/listing_data.dart';
import 'package:job_application_block/screens/homescreen/subforms/preference.dart';
import 'package:job_application_block/screens/homescreen/subforms/reference_contact.dart';
import 'package:job_application_block/screens/homescreen/subforms/technology_you_know.dart';
import 'package:job_application_block/screens/homescreen/subforms/work_experince.dart';
import '../../constants/color.dart';
import '../../database/db_helper.dart';
import 'package:job_application_block/lib/rounded_btn_widget.dart';
import '../preview_screen.dart';
import 'component/floatingActionButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.initDB();

    BlocProvider.of<HomeBloc>(context).add(HomeInitialEvent());
  }

  final _formKey = GlobalKey<FormState>();
  int selectedForm = 1;
  List<String?> icons = [
    "basicdetail.svg",
    "educationdetail.svg",
    "preferences.svg",
    "technology.svg",
    "work.svg",
    "reference.svg",
    "language.svg",
  ];

  Color selected = CommonColor.primaryColor;
  Color unselected = Colors.grey;
  late Color currentColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: CommonColor.backgroundColor,

      floatingActionButton: Floatingactionbutton(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 44,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            boxShadow: CommonColor.boxShadow),
                        height: 30,
                        width: 30,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.navigate_before),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Text(
                        "${state.selectedForm}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0), color: Colors.white, boxShadow: const []),
                        height: 30,
                        width: 30,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: SvgImage(
                            path: "threedotes.svg",
                            imagecolor: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              state.selectedForm <= 6
                  ? SizedBox(
                      height: 40,
                      child: state.selectedForm <= 6
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                if (index <= state.selectedForm) {
                                  currentColor = selected;
                                } else {
                                  currentColor = unselected;
                                }
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (index < state.selectedForm) {
                                          BlocProvider.of<HomeBloc>(context)
                                              .add(HomeChangePageEvent(selectedPage: index));
                                        } else {
                                          Fluttertoast.showToast(
                                            msg: "Please Fill Current Form First",
                                          );
                                        }
                                      },
                                      child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: state.selectedForm == index ? Colors.red : currentColor),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SvgImage(
                                              path: icons[index],
                                            ),
                                          )),
                                    ),
                                    index != 6
                                        ? Container(
                                            height: 5,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                color: state.selectedForm == index ? Colors.grey : currentColor,
                                                shape: BoxShape.rectangle),
                                          )
                                        : Container()
                                  ],
                                );
                              },
                            )
                          : SizedBox())
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Builder(builder: (context) {
                if (state.selectedForm == 0) {
                  return BasicDetails(
                    formKey: _formKey,
                  );
                } else if (state.selectedForm == 1) {
                  return const EducationDatails();
                } else if (state.selectedForm == 5) {
                  return Preference();
                } else if (state.selectedForm == 2) {
                  return TechnologyYouKnow();
                } else if (state.selectedForm == 4) {
                  return ReferenceContact();
                } else if (state.selectedForm == 6) {
                  return const LanguageKnown();
                } else if (state.selectedForm == 3) {
                  return const WorkExperince();
                } else if (state.selectedForm == 7) {
                  return PreviewScreen();
                } else if (state.selectedForm == 8) {
                  return ListingData();
                } else {
                  return const Text("hello");
                }
              }),
              state.selectedForm <= 7
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: RoundedButtton(
                            navigate: () {
                              if (state.selectedForm > 0) {
                                BlocProvider.of<HomeBloc>(context)
                                    .add(HomeChangePageEvent(selectedPage: state.selectedForm - 1));
                              }
                            },
                            backgound: const Color.fromRGBO(227, 225, 241, 1),
                            textColor: const Color.fromRGBO(116, 103, 183, 1),
                            lable: "Previous",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: RoundedButtton(
                            navigate: () async {
                              if (state.selectedForm == 7) {
                                if (state.formDataModel.basicDetailModel.id == -1) {
                                  Map<String, dynamic> basicDetails =
                                      state.formDataModel.basicDetailModel.getBasicDetails();

                                  Map<String, dynamic> prefrenceData =
                                      state.formDataModel.preferedModel.getPreferenceData();

                                  List<Map<String, dynamic>> educationDetailList =
                                      state.formDataModel.educationModel.jsonEducation();

                                  List<Map<String, dynamic>> language =
                                      state.formDataModel.lanuageListModel.jsonLanuage();

                                  print("langu  is in $language");

                                  List<Map<String, dynamic>> workDetailList =
                                      state.formDataModel.workExperienceList.jsonWork();

                                  List<Map<String, dynamic>> referenceList =
                                      state.formDataModel.referenceModelList.jsonReference();

                                  int id = await db.insertData(basicDetails, "basicDetails");
                                  prefrenceData["pid"] = id;

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

                                  context.read<HomeBloc>().add(HomeListingEvent());
                                  context
                                      .read<HomeBloc>()
                                      .add((HomeChangePageEvent(selectedPage: state.selectedForm + 1)));
                                } else {
                                  Map<String, dynamic> basicDetails =
                                      state.formDataModel.basicDetailModel.getBasicDetails();

                                  Map<String, dynamic> prefrenceData =
                                      state.formDataModel.preferedModel.getPreferenceData();

                                  List<Map<String, dynamic>> language =
                                      state.formDataModel.lanuageListModel.jsonLanuage();
                                  List<Map<String, dynamic>> referenceList =
                                      state.formDataModel.referenceModelList.jsonReference();

                                  List<Map<String, dynamic>> educationDetailList =
                                      state.formDataModel.educationModel.jsonEducation();

                                  List<Map<String, dynamic>> workDetailList =
                                      state.formDataModel.workExperienceList.jsonWork();

                                  print(" education list is ${educationDetailList}");

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

                                  print("langu is $language");
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
                                      await db.UpdateData(
                                          educationDetailList[i], educationDetailList[i]['id'], "educationDetails");
                                    }
                                  }

                                  int id = await db.UpdateData(
                                      basicDetails, state.formDataModel.basicDetailModel.id, "basicDetails");

                                  await db.UpdateData(
                                      prefrenceData, state.formDataModel.preferedModel.id, "preference");

                                  context.read<HomeBloc>().add(HomeListingEvent());
                                  context
                                      .read<HomeBloc>()
                                      .add((HomeChangePageEvent(selectedPage: state.selectedForm + 1)));
                                }

                                // dynamic data = await db.getdata();
                              } else {
                                BlocProvider.of<HomeBloc>(context)
                                    .add(HomeChangePageEvent(selectedPage: state.selectedForm + 1));
                              }
                            },
                            lable: state.selectedForm == 7 ? "save" : "Next",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
