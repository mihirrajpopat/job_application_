import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application_block/lib/common_widgets/svg_image.dart';
import 'homescreen/block/home_bloc.dart';
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

        List<List<String>> key = [
          data[0].keys.toList(),
          data[1].keys.toList(),
          data[2].keys.toList(),
          data[3].keys.toList(),
          data[4].keys.toList(),
          data[5].keys.toList(),
        ];
        List<String> heding = [
          "Basic Detail",
          "Education Detail",
          "Language You Know ",
          "Technology You Know",
          ""
              "Work Experience",
          "Reference",
          "Preference"
        ];
        return Expanded(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, indexo) {
                      return Column(
                        children: [
                          Text(
                            " ${heding[indexo]}",
                            style: TextStyle(fontSize: 18),
                          ),
                          DottedBorder(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 10),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: SvgImage(
                                      path: "edit_icon.svg",
                                      imagecolor: Colors.black,
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
                          ),
                        ],
                      );
                    })),
          ),
        );
      },
    );
  }
}
