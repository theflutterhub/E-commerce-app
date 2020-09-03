import 'package:e_commerce/screens/signup.dart';
import 'package:e_commerce/widgets/changescreen.dart';
import 'package:e_commerce/widgets/mytextformField.dart';
import 'package:e_commerce/widgets/passwordtextformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/mybutton.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
final TextEditingController email = TextEditingController();
final TextEditingController userName = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final TextEditingController password = TextEditingController();

void vaildation() async {
  if (email.text.isEmpty && password.text.isEmpty) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Both Flied Are Empty"),
      ),
    );
  } else if (email.text.isEmpty) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Email Is Empty"),
      ),
    );
  } else if (!regExp.hasMatch(email.text)) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Please Try Vaild Email"),
      ),
    );
  } else if (password.text.isEmpty) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Password Is Empty"),
      ),
    );
  } else if (password.text.length < 8) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Password  Is Too Short"),
      ),
    );
  } else {
    try {
  UserCredential result = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: email.text, password: password.text);
  print(result.user.uid);
} on PlatformException catch (e) {
  _scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(e.message),
  ));
}
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  Widget _buildAllPart() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          MyTextFormField(
            name: "Email",
            controller: email,
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: "Password",
            controller: password,
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyButton(
            onPressed: () {
              vaildation();
            },
            name: "Login",
          ),
          ChangeScreen(
              name: "SignUp",
              whichAccount: "I Have Not Account!",
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => SignUp(),
                  ),
                );
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
