import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  String? lable;
  IconData? suffix;
  bool visiblity = true;
  final controller;

  String? hint;
  final String? Function(String?)? checkValidation;
  final Widget? iconbutton;

  // final Widget? suffix;

  TextFormFiledWidget({
    required this.lable,
    this.suffix,
    this.checkValidation,
    this.iconbutton,
    this.visiblity = false,
    this.controller,
    this.hint = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$lable",
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(207, 207, 207, 0.9),
                      offset: Offset(1, 1),
                      blurRadius: 3,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  controller: controller,
                  textAlign: TextAlign.start,
                  obscureText: visiblity,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "$hint",
                    hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.03),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  validator: checkValidation,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
