import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  String? path;
  Color imagecolor;

  SvgImage({super.key, required this.path, this.imagecolor = CupertinoColors.white});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'asset/images/$path',
      color: imagecolor,
      height: 20,
      width: 20,
    );
  }
}
