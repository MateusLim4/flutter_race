import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get title;
  Color get subtitle;
  Color get primary;
  Color get textEnabled;
  Color get inputNormal;
  Color get background;
  Color get iconInative;
  Color get textColor;
  Color get badColor;
  Color get border;
}

class AppColors implements IAppColors {
  @override
  Color get title => const Color(0xFF1E1F20);
  @override
  Color get subtitle => const Color(0xFF7F85A2);
  @override
  Color get primary => const Color(0xFF27AE60);
  @override
  Color get textEnabled => const Color(0xFFFFFFFF);
  @override
  Color get inputNormal => const Color(0xFF949B9C);
  @override
  Color get background => const Color(0xFFF7F7F7);
  @override
  Color get iconInative => const Color(0xFF949B9C);
  @override
  Color get textColor => const Color(0xFF272727);
  @override
  Color get badColor => const Color(0xFFE45851);
  @override
  Color get border => const Color(0xFFE9E9EC);
}
