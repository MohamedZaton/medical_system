import 'package:developer/tools/colors.dart';
import 'package:flutter/material.dart';

import '../tools/styles.dart';

Widget ShadowButton(
    {required String? name,
    Color backgroundColor = kLightPrimary,
    double height = 60.0,
    required Function() onPressed}) {
  return MaterialButton(
    height: height,
    minWidth: double.infinity,
    child: FittedBox(
      child: kCustomText(name,
          fontSize: textSizeLargeMedium,
          textColor: Colors.white,
          fontFamily: fontMedium),
    ),
    textColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    color: backgroundColor,
    onPressed: onPressed,
  );
}
