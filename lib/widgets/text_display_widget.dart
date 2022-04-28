// EditText rounded Style
import 'package:flutter/material.dart';

import '../tools/colors.dart';
import '../tools/styles.dart';

Widget TextDisplayWidget(
    {required String text,
    Color backgroundColor = kDarkAccent,
    required Function() onPressed}) {
  return MaterialButton(
    height: 60,
    minWidth: double.infinity,
    child: kCustomText(text,
        fontSize: textSizeLargeMedium,
        textColor: Colors.white,
        fontFamily: fontMedium),
    textColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
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
