import 'package:developer/tools/colors.dart';
import 'package:flutter/material.dart';

import '../tools/styles.dart';

Widget ShadowButton(
    {required String name,
    Color backgroundColor = kLightPrimary,
    required Function() onPressed}) {
  return MaterialButton(
    height: 60,
    minWidth: double.infinity,
    child: kCustomText(name,
        fontSize: textSizeLargeMedium,
        textColor: Colors.white,
        fontFamily: fontMedium),
    textColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    color: backgroundColor,
    onPressed: onPressed,
  );
}
