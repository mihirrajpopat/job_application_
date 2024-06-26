import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedImageWidget extends StatelessWidget {
  double? size;

  RoundedImageWidget({super.key, this.size = 80.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        border: Border.all(
          width: 3,
          color: Colors.white,
        ),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("asset/images/OIP.jpg"),
        ),
      ),
    );
  }
}
