import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/// Google fonts constant setting_page: https://fonts.google.com/

const fontRegular = 'Sukar';
const fontMedium = 'Sukar';
const fontSemibold = 'Sukar';
const fontBold = 'Bold';
/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 30.0;

TextTheme kTextTheme(theme, String? language) {
  switch (language) {
    case 'vi':
      return GoogleFonts.ralewayTextTheme(theme);
    case 'ar':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme);
  }
}

TextTheme kHeadlineTheme(theme, [language = 'en']) {
  switch (language) {
    case 'vi':
      return GoogleFonts.ralewayTextTheme(theme);
    case 'ar':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme);
  }
}

const kHeaderTextStyle = TextStyle(
  fontSize: 28.0,
  color: kLightPrimary,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);

const kTitleTextStyle = TextStyle(
  fontSize: 15.0,
  color: kLightPrimary,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);
const kSponDetailsStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kDetailsTxtStyle = TextStyle(
  fontSize: 10.0,
  color: Colors.blueGrey,
);

const kLabelTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
Widget kCustomText(
  String? text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: Colors.white,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

const kDefaultPaddin = 20.0;
const List<Color> kPremierColorList = [Color(0XFF026B9A), Color(0XFF3BBCE9)];
