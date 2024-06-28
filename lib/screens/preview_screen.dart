import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application_block/lib/common_widgets/svg_image.dart';
import '../constants/color.dart';
import 'homescreen/block/home_bloc.dart';
import 'homescreen/block/home_event.dart';
import 'homescreen/block/home_state.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List data = [
          state.formDataModel.basicDetailModel.getBasicDetails(),
          state.formDataModel.educationModel.getEducationModel(),
          state.formDataModel.technologyModelList.getTopTechnologyMap(),
          state.formDataModel.workExperienceList.getWorkExperienceMap(),
          state.formDataModel.referenceModelList.getReferenceMap(),
          state.formDataModel.preferedModel.PreferedModelMap(),
        ];

        List<Map<String, dynamic>> language = state.formDataModel.lanuageListModel.getLanguageMap();

        List<List<String>> languagekey = [];

        for (int i = 0; i < language.length; i++) {
          languagekey.add(language[i].keys.toList());
        }

        List<List<String>> key = [
          data[0].keys.toList(),
          data[1].keys.toList(),
          data[2].keys.toList(),
          data[3].keys.toList(),
          data[4].keys.toList(),
          data[5].keys.toList(),
        ];
        List<String> heding = [
          "Basic Details",
          "Education Details",
          "Technology You Know",
          "Work Experience",
          "Reference Details",
          "Preference Details"
        ];
        return Expanded(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, indexo) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: CommonColor.boxShadow,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          boxShadow: CommonColor.boxShadow1,
                                          color: Color.fromRGBO(249, 248, 252, 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 10, top: 5, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text(
                                                  " ${heding[indexo]}",
                                                  style: TextStyle(fontSize: 20),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                  onTap: () {
                                                    BlocProvider.of<HomeBloc>(context)
                                                        .add(HomeChangePageEvent(selectedPage: indexo));
                                                  },
                                                  child: SvgImage(
                                                    path: "edit_icon.svg",
                                                    imagecolor: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: data[indexo].length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                                                  child: SingleChildScrollView(
                                                    scrollDirection: Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: 140,
                                                          child: Text(
                                                            key[indexo][index],
                                                            style: TextStyle(fontSize: 18),
                                                          ),
                                                        ),
                                                        data[indexo][key[indexo][index]].runtimeType == List
                                                            ? Text(" : ${data[indexo][key[indexo][index]].join(',')} ",
                                                                style: const TextStyle(fontSize: 18))
                                                            : Text(" : ${data[indexo][key[indexo][index]]} ",
                                                                style: const TextStyle(fontSize: 18))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: language.length,
                            itemBuilder: (context, indexo) {
                              return Padding(
                                padding: EdgeInsets.only(right: 10, top: 5, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: CommonColor.boxShadow,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              boxShadow: CommonColor.boxShadow1,
                                              color: Color.fromRGBO(249, 248, 252, 1),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 10, top: 5, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Language Known",
                                                    style: TextStyle(fontSize: 18),
                                                  ),
                                                  Align(
                                                      alignment: Alignment.topRight,
                                                      child: indexo == 0
                                                          ? InkWell(
                                                              onTap: () {
                                                                BlocProvider.of<HomeBloc>(context)
                                                                    .add(HomeChangePageEvent(selectedPage: 6));
                                                              },
                                                              child: SvgImage(
                                                                path: "edit_icon.svg",
                                                                imagecolor: Colors.black,
                                                              ),
                                                            )
                                                          : SizedBox()),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ListView.builder(
                                              padding: EdgeInsets.zero,
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: language[indexo].length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10, bottom: 5),
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: 140,
                                                              child: Text(
                                                                languagekey[indexo][index],
                                                                style: const TextStyle(fontSize: 18),
                                                              ),
                                                            ),
                                                            Text(" : ${language[indexo][languagekey[indexo][index]]} ",
                                                                style: const TextStyle(fontSize: 18))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
