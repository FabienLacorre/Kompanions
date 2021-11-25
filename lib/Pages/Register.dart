import 'package:flutter/material.dart';
import 'package:kompanions/Api/UserRequest.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Widgets/ErrorSnackBar.dart';
import 'package:kompanions/Widgets/CustomText.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomTextField.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
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

  handlerRegisterValidation() async {
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                content: 'INSCRIPTION',
                size: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                  placeHolder: "Email", controller: emailController),
              SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                  placeHolder: "Mot de passe", controller: passwordController),
              SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                  placeHolder: "Confimation du mot de passe",
                  controller: confirmPasswordController),
              SizedBox(
                height: 15.0,
              ),
              CustomButton(
                content: "S'inscrire",
                handler: this.handlerRegisterValidation,
              ),
              SizedBox(
                height: 15.0,
              ),
              new GestureDetector(
                onTap: this.handlerLoginRediction,
                child: CustomText(
                  content: "Vous avez deja un compte, connectez vous ici!",
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
