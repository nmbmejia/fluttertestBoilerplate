import 'package:boilerplate/components/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/components/CustomInput.dart';
import 'package:boilerplate/services/app_constants.dart' as AppConstants;

import 'homepage.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  BuildContext scaffoldContext;
  bool rememberMe = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;
    if (rememberMe) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  });



  void goToHomepage() {
    if(usernameController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackbar("Fields cannot be blank.");
    } else {
      if(AppConstants.login == usernameController.text && AppConstants.password == passwordController.text)
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
      else  showSnackbar("User does not exist.");
    }
  }

  void showSnackbar(String message) {
    var snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

@override
  Widget build(BuildContext context) {




    var windowType = Text(
      "Log In",
      style: TextStyle(fontSize: 40.0, color: Colors.white70, fontWeight: FontWeight.bold),
    );

    var usernameField = CustomInput(controller: usernameController, hinttext: "Username", iconlink: Icon(Icons.person, color: Colors.white70), keyboardType: TextInputType.text,);
    var passwordField = CustomInput(controller: passwordController, hinttext: "Password", iconlink: Icon(Icons.lock, color: Colors.white70), keyboardType: TextInputType.visiblePassword, obscureText: true,);

    var loginButton = CustomButton(hinttext: "Log in", onPressFunctionality: goToHomepage,);
    var rememberMeChk = Checkbox(
        value: rememberMe,
        onChanged: _onRememberMeChanged,
        checkColor: Color(0xFFA0273B),
        activeColor: Colors.white70,
        fillColor: MaterialStateProperty.all(Colors.white70),
    );



    return Scaffold(
      backgroundColor: Color(0xFF24253C),
      body: Container(
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.125),
                windowType,
                SizedBox(height: 30.0),
                usernameField,
                SizedBox(height: 20.0),
                passwordField,
                SizedBox(height: 10.0),
                Row(
                  children: [
                    rememberMeChk,
                    Text("Remember me", style: TextStyle(color: Colors.white70)),
                  ],
                ),
                SizedBox(height: 50.0),
                loginButton,
              ],
            )
          ],
        ),
      )

    );
  }
}
