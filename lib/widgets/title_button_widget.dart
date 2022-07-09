// EditText rounded Style
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';

import '../tools/colors.dart';
import '../tools/styles.dart';

class TitleButtonWidget extends StatelessWidget {
  final String? title;
  final String? rightImgPath;
  final Color backgroundColor;
  final double radius;
  final Function() onPressed;

  const TitleButtonWidget(
      {Key? key,
      required this.title,
      this.backgroundColor = kDarkAccent,
      this.radius = 40.0,
      required this.onPressed,
      this.rightImgPath = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      minWidth: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: kCustomText(title,
                textColor: Colors.white, fontFamily: fontMedium),
          ),
          if (rightImgPath != null) ...[
            SizedBox(
              width: 20,
            ),
            FluxImage(
              imageUrl: rightImgPath.toString(),
              width: 40,
              height: 40,
            ),
          ],
        ],
      ),
      textColor: Colors.white,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      color: backgroundColor,
      onPressed: onPressed,
    );
  }
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
