// EditText rounded Style
import 'package:flutter/material.dart';

import '../tools/colors.dart';
import '../tools/styles.dart';

Widget TitleButtonWidget(
    {required String title,
    Color backgroundColor = kDarkAccent,
    double radius = 40.0,
    required Function() onPressed}) {
  return MaterialButton(
    height: 60,
    minWidth: double.infinity,
    child: kCustomText(title,
        fontSize: textSizeLargeMedium,
        textColor: Colors.white,
        fontFamily: fontMedium),
    textColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    color: backgroundColor,
    onPressed: onPressed,
  );
}
/*
        contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: kEditTextBkgd,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: kEditTextBkgd, width: 0.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: kEditTextBkgd, width: 0.0),
        ),
* */
