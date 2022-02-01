import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/ui/pages/register/forms/register_form.dart';
import 'package:flutter_frontend_test/ui/widgets/background/background.dart';
import 'package:flutter_frontend_test/ui/widgets/buttons/change_theme_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: const [
            Background(),
            RegisterForm(),
            Positioned(
              top: 28,
              left: 16,
              child: ChangeThemeIconButton(),
            ),
          ],
        ),
      ),
    );
  }
}
