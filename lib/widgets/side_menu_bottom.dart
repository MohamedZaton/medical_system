import 'package:flutter/material.dart';

import '../tools/colors.dart';
import '../tools/styles.dart';
import '../utils/images_path.dart';

class SideMenuButton extends StatelessWidget {
  final String centerTitle;
  final double width;
  final double height;
  final double? iconScale;
  final Color? colorBackground;
  final String? rightImagePath;

  const SideMenuButton({
    Key? key,
    required this.centerTitle,
    this.rightImagePath = kCalenderIcon,
    required this.width,
    required this.height,
    this.colorBackground = kDarkAccent,
    this.iconScale = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
          ),
          kCustomText(centerTitle,
              fontSize: textSizeLargeMedium,
              textColor: Colors.white,
              fontFamily: fontMedium),
          Image.asset(
            rightImagePath!,
            scale: iconScale,
          ),
        ],
      ),
    );
  }
}
