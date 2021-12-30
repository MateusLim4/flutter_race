import 'package:myapp/shared/theme/colors.dart';
import 'package:myapp/shared/theme/textStyles.dart';

export 'text.dart';

class AppTheme {
  static AppTheme instance = AppTheme();

  final _colors = AppColors();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStyles();
  static AppTextStyles get textStyles => instance._textStyles;
}
