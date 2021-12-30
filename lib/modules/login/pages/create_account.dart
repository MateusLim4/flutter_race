import 'package:flutter/material.dart';
import 'package:myapp/shared/theme/app_theme.dart';
import 'package:myapp/shared/widget/button.dart';
import 'package:myapp/shared/widget/input_text.dart';
import 'package:validators/validators.dart';

import 'create_account_controller.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final controller = CreateAccountController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.addListener(() {
      controller.state.when(
          success: (value) => Navigator.pushNamed(context, '/home'),
          error: (message, _) => scaffoldKey.currentState!.showBottomSheet(
              (context) => BottomSheet(
                  onClosing: () {},
                  builder: (context) => Container(child: Text(message)))),
          orElse: () {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      appBar: AppBar(
          backgroundColor: AppTheme.colors.background,
          elevation: 0,
          leading: BackButton(color: AppTheme.colors.textColor)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Text("Criando uma conta", style: AppTheme.textStyles.title),
                SizedBox(height: 10),
                Text('Mantenha seus gastos em dia',
                    style: AppTheme.textStyles.hint),
                SizedBox(height: 38),
                InputText(
                  label: 'Nome',
                  hint: 'Digite seu nome completo',
                  validator: (value) =>
                      value.isNotEmpty ? null : "Digite um nome válido!",
                  onChanged: (value) => controller.onChanged(name: value),
                ),
                SizedBox(height: 18),
                InputText(
                  label: 'Email',
                  hint: 'Digite seu email',
                  validator: (value) =>
                      isEmail(value) ? null : "Digite um e-mail válido!",
                  onChanged: (value) => controller.onChanged(email: value),
                ),
                SizedBox(height: 18),
                InputText(
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  obscure: true,
                  validator: (value) =>
                      value.length >= 6 ? null : "Digite uma senha forte!",
                  onChanged: (value) => controller.onChanged(name: value),
                ),
                SizedBox(height: 14),
                AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) => controller.state.when(
                          loading: () =>
                              Center(child: CircularProgressIndicator()),
                          orElse: () => Button(
                              label: "Criar conta",
                              type: ButtonType.fill,
                              onTap: () {
                                controller.create();
                              }),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
