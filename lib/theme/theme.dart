import 'package:flutter/material.dart';
import 'package:flutter_todo/common/constant.dart';
import 'package:flutter_todo/theme/color.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  primaryColor: AppColor.primary,
  primaryColorDark: AppColor.darkPrimary,
  colorScheme: const ColorScheme.light(
    primary: AppColor.primary,
    secondary: AppColor.secondary,
  ),
  cardTheme: CardTheme(
    shape: kCardShape,
    margin: kPadding,
  ),
  dividerTheme: const DividerThemeData(
    space: 0,
    thickness: 1,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,
  primaryColor: AppColor.primary,
  primaryColorDark: AppColor.darkPrimary,
  colorScheme: const ColorScheme.dark(
    primary: AppColor.darkPrimary,
    secondary: AppColor.darkSecondary,
  ),
  cardTheme: CardTheme(
    shape: kCardShape,
    margin: kPadding,
  ),
  dividerTheme: const DividerThemeData(
    space: 0,
    thickness: 1,
  ),
);
