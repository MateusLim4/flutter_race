import 'package:flutter/material.dart';
import 'package:myapp/shared/theme/app_theme.dart';
import 'package:myapp/shared/widget/button.dart';
import 'package:myapp/shared/widget/input_text.dart';
import 'package:validators/validators.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.addListener(() {
      controller.state.when(
        success: (value) => Navigator.pushReplacementNamed(context, '/home'),
        error: (message, _) => scaffoldKey.currentState!.showBottomSheet(
            (context) => BottomSheet(
                onClosing: () {},
                builder: (context) => Container(child: Text(message)))),
        loading: () => print('loading'),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Image.asset('assets/images/logo.png', width: 200),
                InputText(
                    label: 'Email',
                    hint: 'Digite seu email',
                    validator: (value) =>
                        isEmail(value) ? null : "Digite um e-mail válido!",
                    onChanged: (value) => controller.onChanged(email: value)),
                SizedBox(height: 18),
                InputText(
                    label: 'Senha',
                    hint: 'Digite sua senha',
                    obscure: true,
                    validator: (value) =>
                        value.length >= 6 ? null : "Preencha a senha!",
                    onChanged: (value) =>
                        controller.onChanged(password: value)),
                SizedBox(height: 25),
                AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) => controller.state.when(
                          loading: () =>
                              Center(child: CircularProgressIndicator()),
                          orElse: () => Column(
                            children: [
                              Button(
                                  label: "Entrar",
                                  type: ButtonType.fill,
                                  onTap: () async {
                                    await controller.login();
                                  }),
                              SizedBox(height: 50),
                              Button(
                                  label: "Criar conta",
                                  type: ButtonType.outline,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/login/create-account');
                                  }),
                            ],
                          ),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
