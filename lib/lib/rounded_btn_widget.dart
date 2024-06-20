import 'package:flutter/material.dart';

class RoundedButtton extends StatelessWidget {
  VoidCallback? navigate;
  String? lable;
  Color backgound;
  Color textColor;
  bool isTrue;

  RoundedButtton(
      {super.key,
      required this.navigate,
      required this.lable,
      this.backgound = const Color.fromRGBO(116, 103, 183, 1),
      this.textColor = Colors.white,
      this.isTrue = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: []),
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                backgroundColor: WidgetStateProperty.all<Color>(backgound),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: isTrue == true
                        ? BorderSide(color: Color.fromRGBO(0, 0, 0, 0))
                        : BorderSide(width: 1, color: Color.fromRGBO(18, 82, 234, 1)),
                  ),
                ),
              ),
              onPressed: navigate,
              child: Text(
                "$lable",
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
