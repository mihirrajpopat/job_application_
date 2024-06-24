import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib/textformfiled_widget.dart';
import '../../../models/checkbox_item.dart';
import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class LanguageKnown extends StatelessWidget {
  const LanguageKnown({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DottedBorder(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: state.formDataModel.languageModel.val
                            .map(
                              (line) => SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Text("${state.formDataModel.languageModel.language[index++]}"),
                                      ),
                                      Row(
                                        children: line.keys
                                            .map((key) => Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 110,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 43,
                                                            child: CheckboxListTile(
                                                              contentPadding: EdgeInsets.zero,
                                                              dense: true,
                                                              visualDensity: const VisualDensity(
                                                                horizontal: VisualDensity.minimumDensity,
                                                                vertical: VisualDensity.minimumDensity,
                                                              ),
                                                              value: line[key],
                                                              onChanged: (bool? value) {
                                                                context.read<HomeBloc>().add(HomeAddLanguageEvent());

                                                                line[key] = value!;
                                                              },
                                                            ),
                                                          ),
                                                          Flexible(
                                                              child: Text(
                                                            "${key} ",
                                                            style: const TextStyle(fontSize: 13),
                                                          )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormFiledWidget(
                                  controller: context.read<HomeBloc>().languageController,
                                  lable: "Add New Language",
                                  hint: "French",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    context.read<HomeBloc>().add(HomeAddLanguageEvent());
                                    Navigator.pop(context);
                                  },
                                  child: const Text("ADD"),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [const Text("ADD"), IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
