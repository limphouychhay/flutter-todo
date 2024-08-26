import 'package:flutter_todo/common/constant.dart';

enum AppearanceData {
  light._(
    name: 'Light',
    mode: AppearanceMode.light,
    isRadiusTop: true,
  ),
  dark._(
    name: 'Dark',
    mode: AppearanceMode.dark,
  ),
  system._(
    name: 'System',
    mode: AppearanceMode.system,
    isRadiusBottom: true,
  ),
  ;

  const AppearanceData._({
    required this.name,
    required this.mode,
    this.isRadiusTop = false,
    this.isRadiusBottom = false,
  });

  final String name;
  final String mode;
  final bool isRadiusTop;
  final bool isRadiusBottom;

  static AppearanceData from({required String? mode}) {
    if (mode == null) {
      return AppearanceData.system;
    }
    for (final value in AppearanceData.values) {
      if (value.mode == mode) {
        return value;
      }
    }
    return AppearanceData.system;
  }
}
