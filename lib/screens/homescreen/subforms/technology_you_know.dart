import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/checkbox_item.dart';
import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class TechnologyYouKnow extends StatelessWidget {
  TechnologyYouKnow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.formDataModel.technologyModelList.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      child: Text("${state.formDataModel.technologyYouKnow.technology[index]}"),
                    ),
                    Container(
                      width: 50,
                      child: Radio(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        groupValue: state.formDataModel.technologyModelList.data[index].know,
                        value: "Beginer",
                        onChanged: (val) {
                          BlocProvider.of<HomeBloc>(context)
                              .add(HomeChangeGenderEventEducation(index: index, radioValue: val.toString()));
                        },
                      ),
                    ),
                    Container(
                      width: 60,
                      child: Text("Beginer"),
                    ),
                    Container(
                      width: 50,
                      child: Radio(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        groupValue: state.formDataModel.technologyModelList.data[index].know,
                        value: "mediator",
                        onChanged: (val) {
                          BlocProvider.of<HomeBloc>(context)
                              .add(HomeChangeGenderEventEducation(index: index, radioValue: val.toString()));
                        },
                      ),
                    ),
                    Container(
                      width: 66,
                      child: Text("Meadiator"),
                    ),
                    Container(
                      width: 50,
                      child: Radio(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        groupValue: state.formDataModel.technologyModelList.data[index].know,
                        value: "Export",
                        onChanged: (val) {
                          BlocProvider.of<HomeBloc>(context)
                              .add(HomeChangeGenderEventEducation(index: index, radioValue: val.toString()));
                        },
                      ),
                    ),
                    Text("Export"),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
