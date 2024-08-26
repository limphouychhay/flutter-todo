import 'package:flutter/material.dart';
import 'package:flutter_todo/common/constant.dart';

enum LanguageData {
  khmer._(
    name: 'ភាសាខ្មែរ',
    appLanguage: 'km-KH',
    locale: Locale(AppLanguage.km),
    isRadiusTop: true,
  ),
  english._(
    name: 'English',
    appLanguage: 'en-US',
    locale: Locale(AppLanguage.en),
    isRadiusBottom: true,
  ),
  ;

  const LanguageData._({
    required this.name,
    required this.appLanguage,
    required this.locale,
    this.isRadiusTop = false,
    this.isRadiusBottom = false,
  });

  final String name;
  final String appLanguage;
  final Locale locale;
  final bool isRadiusTop;
  final bool isRadiusBottom;

  static LanguageData from({required String? appLanguage}) {
    if (appLanguage == null) {
      return LanguageData.english;
    }
    for (final value in LanguageData.values) {
      if (value.appLanguage == appLanguage) {
        return value;
      }
    }
    return LanguageData.english;
  }
}
