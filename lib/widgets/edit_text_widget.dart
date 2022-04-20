// EditText rounded Style
import 'package:flutter/material.dart';

import '../tools/colors.dart';
import '../tools/styles.dart';

Padding EditTextStyle(var hintText,
    {isPassword = false, TextEditingController? controller}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: TextFormField(
      textAlign: TextAlign.right,
      style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
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
      ),
    ),
  );
}
