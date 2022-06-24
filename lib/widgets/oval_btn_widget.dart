import 'package:flutter/material.dart';

import '../tools/colors.dart';
import 'flux_image.dart';

class OvalButtonWdgt extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final String? imagePath;
  final bool isCenter;
  final void Function()? onPressed;

  OvalButtonWdgt(
      {Key? key,
      required this.text,
      this.textColor = Colors.white,
      this.backgroundColor = kLightAccent,
      required this.onPressed,
      this.imagePath,
      this.isCenter = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: MaterialButton(
        child: Row(
          mainAxisAlignment:
              isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            leftIcon(imagePath ?? ""),
            FittedBox(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Sukar',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        textColor: textColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(40.0)),
        color: backgroundColor,
        onPressed: onPressed,
      ),
    );
  }

  Widget leftIcon(String imagePath) {
    return (imagePath == "")
        ? SizedBox(
            height: 1,
          )
        : Row(
            children: [
              SizedBox(
                width: 8,
              ),
              FluxImage(imageUrl: imagePath),
              SizedBox(
                width: 8,
              )
            ],
          );
  }
}
