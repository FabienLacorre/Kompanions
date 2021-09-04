import 'package:flutter/material.dart';
import './Home.dart';
import './Login.dart';
import '../Widgets/CustomText.dart';
import '../Widgets/CustomButton.dart';
import '../Widgets/CustomTextField.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  handlerRegisterValidation() {
    Route route = MaterialPageRoute(builder: (context) => Home());
    Navigator.pushReplacement(context, route);
  }

  handlerLoginRediction() {
    Route route = MaterialPageRoute(builder: (context) => Login());
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
                content: 'INSCRIPTION',
                size: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomButton(
                content: "Continuer avec Google",
                handler: this.handlerRegisterValidation,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomButton(
                content: "Continuer avec Facebook",
                handler: this.handlerRegisterValidation,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomTextField(placeHolder: "Email"),
              SizedBox(
                height: 15.0,
              ),
              CustomTextField(placeHolder: "Mot de passe"),
              SizedBox(
                height: 15.0,
              ),
              CustomTextField(placeHolder: "Confimation du mot de passe"),
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
