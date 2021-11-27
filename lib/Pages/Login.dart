import 'package:flutter/material.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Widgets/ErrorSnackBar.dart';
import 'package:kompanions/Widgets/CustomText.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomTextField.dart';
import 'package:kompanions/Api/UserRequest.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    initDummyValues();
  }

  initDummyValues() {
    emailController.text = "fab.lacorre@gmail.com";
    passwordController.text = "test";
  }

  handlerConnexionValidation() async {
    try {
      UserRequest userRequest = new UserRequest();
      await userRequest.connect(emailController.text, passwordController.text);
      homeRedirection(context);
    } catch (error) {
      errorSnackBar(context, error.toString());
    }
  }

  handlerRegisterRediction() {
    registerRedirection(context);
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
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('../../assets/logo.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 16),
              CustomTextField(
                  placeHolder: "Email", controller: emailController),
              SizedBox(height: 16),
              CustomTextField(
                  placeHolder: "Mot de passe", controller: passwordController),
              SizedBox(height: 16),
              CustomButton(
                content: "Se connecter",
                handler: this.handlerConnexionValidation,
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: this.handlerRegisterRediction,
                child: CustomText(
                  content: "Cliquez ici pour vous inscrire!",
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
