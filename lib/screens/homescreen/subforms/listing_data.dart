import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_application_block/screens/homescreen/block/home_bloc.dart';

import '../../../database/db_helper.dart';
import '../../../lib/common_widgets/svg_image.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class ListingData extends StatefulWidget {
  const ListingData({super.key});

  @override
  State<ListingData> createState() => _ListingDataState();
}

class _ListingDataState extends State<ListingData> {
  var data;

  DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState

    context.read<HomeBloc>().add(HomeListingEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Candidates",
                  style: TextStyle(fontSize: 18),
                ),
                ListView.builder(
                  itemCount: state.listingData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(227, 225, 241, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(207, 207, 207, 0.9),
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                spreadRadius: 0,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " Name : ${state.listingData[index]['firstName']}  ${state.listingData[index]['lastName']}",
                                    style: TextStyle(color: Color.fromRGBO(116, 103, 183, 1), fontSize: 15),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context.read<HomeBloc>().add(HomeEditEvent(state.listingData[index]['id']));
                                        },
                                        child: SvgImage(
                                          path: "eye_icon.svg",
                                          imagecolor: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.read<HomeBloc>().add(HomeDeleteEvent(state.listingData[index]['id']));
                                        },
                                        child: SvgImage(
                                          path: "delete_icon.svg",
                                          imagecolor: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    " Mail :  ${state.listingData[index]['email']}",
                                    style: TextStyle(color: Color.fromRGBO(116, 103, 183, 1), fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
