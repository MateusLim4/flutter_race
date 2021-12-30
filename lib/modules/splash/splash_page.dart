import 'package:flutter/material.dart';
import 'package:myapp/shared/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Troca da Splash page para a página de login/homepage
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, '/login');
    });
    return Scaffold(
        backgroundColor: AppTheme.colors.background,
        body: Center(child: Image.asset("assets/images/logo.png")));
  }
}
