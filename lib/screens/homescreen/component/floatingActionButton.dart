import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/color.dart';
import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class Floatingactionbutton extends StatelessWidget {
  const Floatingactionbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.selectedForm == 8
            ? FloatingActionButton(
                onPressed: () {
                  context.read<HomeBloc>().add((HomeAddCandidate()));
                },
                backgroundColor: CommonColor.primaryColor,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : Container();
      },
    );
  }
}
