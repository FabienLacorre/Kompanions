import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kompanions/Api/UserRequest.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Theme/CustomTheme.dart';
import 'package:kompanions/Widgets/ErrorSnackBar.dart';
import 'package:kompanions/Widgets/CustomText.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomTextField.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    initDummyValues();
  }

  initDummyValues() {
    emailController.text = "fab.lacorre@gmail.com";
    passwordController.text = "test";
    confirmPasswordController.text = "test";
  }

  handlerRegisterPageValidation() async {
    try {
      UserRequest userRequest = new UserRequest();
      await userRequest.register(emailController.text, passwordController.text,
          confirmPasswordController.text);
      await userRequest.connect(emailController.text, passwordController.text);
      homeRedirection(context);
    } catch (error) {
      errorSnackBar(context, error.toString());
    }
  }

  handlerLoginRediction() {
    loginRedirection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrayColorMaterial,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                content: "Kompanions",
                size: 40,
                color: greenColorMaterial,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.getFont('Allerta Stencil',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 48),
              RoundTextField(placeHolder: "Email", controller: emailController),
              SizedBox(height: 16),
              RoundTextField(
                  placeHolder: "Mot de passe", controller: passwordController),
              SizedBox(height: 16),
              RoundTextField(
                  placeHolder: "Confimation du mot de passe",
                  controller: confirmPasswordController),
              SizedBox(height: 16),
              CustomButton(
                radius: 100,
                content: "S'inscrire",
                handler: this.handlerRegisterPageValidation,
              ),
              SizedBox(height: 32),
              new GestureDetector(
                onTap: this.handlerLoginRediction,
                child: CustomText(
                  color: ghostWhiteColorMaterial,
                  content: "Vous avez deja un compte, connectez vous ici !",
                  size: 12,
                  underline: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
