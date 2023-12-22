import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: getColorFromHex("#315399"),
  textTheme: const TextTheme().apply(
    displayColor: getColorFromHex("#000000"),
    bodyColor: getColorFromHex("#000000")
  ),
  colorScheme: ColorScheme.light(
    primary: getColorFromHex("#315399"),
  ),
  fontFamily: 'Montserrat',
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: getColorFromHex("#315399"),
  textTheme: const TextTheme().apply(
    displayColor: getColorFromHex("#000000"),
    bodyColor: getColorFromHex("#000000")
  ),
  colorScheme: ColorScheme.dark(
    primary: getColorFromHex("#315399"),
  ),
   fontFamily: 'Montserrat',
);