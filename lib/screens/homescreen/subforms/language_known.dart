import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application_block/constants/color.dart';

import '../../../lib/textformfiled_widget.dart';

import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class LanguageKnown extends StatefulWidget {
  const LanguageKnown({super.key});

  @override
  State<LanguageKnown> createState() => _LanguageKnownState();
}

class _LanguageKnownState extends State<LanguageKnown> {
  @override
  Widget build(BuildContext context) {
    int index = 0;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Langunage Known",
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: state.formDataModel.lanuageListModel.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                      child: Column(
                        children: [
                          if (state.formDataModel.lanuageListModel.data.length > 1) ...[
                            Row(
                              children: [
                                const Text("Remove"),
                                IconButton(
                                  onPressed: () {
                                    context.read<HomeBloc>().add(HomeRemoveLanguageEvent(index: index));
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                  ),
                                )
                              ],
                            )
                          ],
                          DottedBorder(
                            color: CommonColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Text(state.formDataModel.lanuageListModel.data[index].languageName),
                                  ),
                                  Checkbox(
                                    value: state.formDataModel.lanuageListModel.data[index].val.values.elementAt(0),
                                    onChanged: (bool? value) {
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(HomeLanguageCheckboxEvent(index: index, value: value, valindex: "Read"));
                                    },
                                  ),
                                  Text(state.formDataModel.lanuageListModel.data[index].val.keys.elementAt(0)),
                                  Checkbox(
                                    value: state.formDataModel.lanuageListModel.data[index].val.values.elementAt(1),
                                    onChanged: (bool? value) {
                                      BlocProvider.of<HomeBloc>(context).add(
                                          HomeLanguageCheckboxEvent(index: index, value: value, valindex: "Write"));
                                    },
                                  ),
                                  Text(state.formDataModel.lanuageListModel.data[index].val.keys.elementAt(1)),
                                  Checkbox(
                                    value: state.formDataModel.lanuageListModel.data[index].val.values.elementAt(2),
                                    onChanged: (bool? value) {
                                      BlocProvider.of<HomeBloc>(context).add(
                                          HomeLanguageCheckboxEvent(index: index, value: value, valindex: "Speak"));
                                    },
                                  ),
                                  Text(state.formDataModel.lanuageListModel.data[index].val.keys.elementAt(2)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      const Text("Add"),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  color: Colors.red,
                                  child: AlertDialog(
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
                                  ),
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.add_circle_outline_outlined,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
