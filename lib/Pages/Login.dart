import 'package:flutter/material.dart';
import 'package:kompanions/Pages/Register.dart';
import './Home.dart';
import './Register.dart';
import '../Widgets/CustomText.dart';
import '../Widgets/CustomButton.dart';
import '../Widgets/CustomTextField.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  handlerConnexionValidation() {
    Route route = MaterialPageRoute(builder: (context) => Home());
    Navigator.pushReplacement(context, route);
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
              CustomTextField(placeHolder: "Email"),
              SizedBox(height: 16),
              CustomTextField(placeHolder: "Mot de passe"),
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
