import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_application_block/constants/color.dart';
import 'package:job_application_block/screens/homescreen/block/home_bloc.dart';

import '../../../database/db_helper.dart';
import '../../../lib/common_widgets/rounded_image_widget.dart';
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
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.listingData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: CommonColor.boxShadow,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: CommonColor.boxShadow1,
                                color: Color.fromRGBO(249, 248, 252, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        RoundedImageWidget(
                                          size: 40,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "${state.listingData[index]['firstName']}  ${state.listingData[index]['lastName']} ",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6.0),
                                              color: Colors.white,
                                              boxShadow: CommonColor.boxShadow1),
                                          height: 40,
                                          width: 40,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            icon: Align(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<HomeBloc>()
                                                      .add(HomeEditEvent(state.listingData[index]['id']));
                                                },
                                                child: SvgImage(
                                                  path: "eye.svg",
                                                  imagecolor: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6.0),
                                              color: Colors.white,
                                              boxShadow: CommonColor.boxShadow),
                                          height: 40,
                                          width: 40,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            icon: Align(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<HomeBloc>()
                                                      .add(HomeDeleteEvent(state.listingData[index]['id']));
                                                },
                                                child: SvgImage(
                                                  path: "delete_icon.svg",
                                                  imagecolor: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.listingData[index]['designation']} ",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${state.listingData[index]['email']} ",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${state.listingData[index]['phoneNumber']} ",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${state.listingData[index]['state']} ",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
