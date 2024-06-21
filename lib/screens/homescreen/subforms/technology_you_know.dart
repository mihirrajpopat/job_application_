import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/checkbox_item.dart';
import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class TechnologyYouKnow extends StatelessWidget {
  TechnologyYouKnow({super.key});

  List<CheckboxItem> fList = [
    CheckboxItem(
      index: 1,
      name: "male",
    ),
    CheckboxItem(
      index: 2,
      name: "female",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.formDataModel.technologyYouKnow.technology.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: DottedBorder(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(state.formDataModel.technologyYouKnow.technology[index]),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: state.formDataModel.technologyYouKnow.checkbox[index].data
                                  .map((data) => Container(
                                        width: 110,
                                        child: RadioListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Text("${data.name}"),
                                          visualDensity: const VisualDensity(
                                            horizontal: VisualDensity.minimumDensity,
                                            vertical: VisualDensity.minimumDensity,
                                          ),
                                          groupValue: state.formDataModel.basicDetailModel.grpId,
                                          dense: true,
                                          value: data,
                                          onChanged: (val) {
                                            BlocProvider.of<HomeBloc>(context).add(HomeChangeGenderEventEducation(
                                                grpid: data.index!, radioGenderValue: data.name!));
                                          },
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
