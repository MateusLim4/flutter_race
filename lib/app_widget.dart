import 'package:flutter/material.dart';
import 'package:myapp/modules/login/login_page.dart';

import 'modules/home/homepage.dart';
import 'modules/login/pages/create_account.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter race #1',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/splash',
        debugShowCheckedModeBanner: false,
        routes: {
          "/splash": (context) => SplashPage(),
          "/login": (context) => const LoginPage(),
          "/login/create-account": (context) => CreateAccountPage(),
          '/home': (context) => HomePage(),
        });
  }
}
