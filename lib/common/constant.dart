import 'package:flutter/material.dart';

final kCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(16),
);

const kPadding = EdgeInsets.all(16);
const kBodyPadding = EdgeInsets.symmetric(horizontal: 16);

class AppLanguage {
  static const en = 'en';
  static const km = 'km';
}

class AppearanceMode {
  static const light = 'light';
  static const dark = 'dark';
  static const system = 'system';
}
