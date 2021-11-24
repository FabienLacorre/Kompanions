import 'package:flutter/material.dart';
import 'package:kompanions/Pages/Register.dart';
import 'package:kompanions/Pages/Home.dart';
import 'package:kompanions/Utils/ErrorSnackBar.dart';
import 'package:kompanions/Widgets/CustomText.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomTextField.dart';
import 'package:kompanions/Api/UserRequest.dart';
import 'package:kompanions/FlutterStorage.dart';

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
    emailController.text = "fab.lacorre@gmail.com";
    passwordController.text = "test";
  }

  handlerConnexionValidation() async {
    try {
      UserRequest userRequest = new UserRequest();
      var result = await userRequest.connect(
          emailController.text, passwordController.text);
      FlutterStorage.storage.write(key: "jwt", value: result["token"]);
      Route route = MaterialPageRoute(builder: (context) => Home());
      Navigator.pushReplacement(context, route);
    } catch (error) {
      errorSnackBar(context, error.toString());
    }
  }

  handlerRegisterRediction() {
    Route route = MaterialPageRoute(builder: (context) => Register());
    Navigator.pushReplacement(context, route);
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
                content: 'CONNEXION',
                size: 30,
                fontWeight: FontWeight.bold,
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
