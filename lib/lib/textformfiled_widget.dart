import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFiledWidget extends StatelessWidget {
  String? lable;
  IconData? suffix;
  bool visiblity = true;
  final controller;
  TextInputType? type;
  List<TextInputFormatter> format;
  int maxLength;
  int minLine;
  int height;

  String? hint;
  final String? Function(String?)? checkValidation;
  final Widget? iconbutton;

  // final Widget? suffix;

  TextFormFiledWidget(
      {required this.lable,
      this.suffix,
      this.checkValidation,
      this.iconbutton,
      this.visiblity = false,
      this.controller,
      this.hint = "",
      this.format = const [],
      this.minLine = 1,
      this.height = 40,
      this.maxLength = 150,
      this.type = TextInputType.text});

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
        Container(
          height: height.toDouble(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextFormField(
                  minLines: minLine,
                  maxLines: 5,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: maxLength,
                  inputFormatters: format,
                  keyboardType: type,
                  cursorColor: Colors.grey,
                  controller: controller,
                  textAlign: TextAlign.start,
                  obscureText: visiblity,
                  decoration: InputDecoration(
                    counterText: "",
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "$hint",
                    hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.2)),
                    contentPadding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Color.fromRGBO(0, 0, 0, 0.2),
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
            ],
          ),
        ),
      ],
    );
  }
}
