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
String email;
String password;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
void vaildation() async {
  final FormState _form = _formKey.currentState;
  if (!_form.validate()) {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(result.user.uid);
    } on PlatformException catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  } else {
    print("No");
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
            onChanged: (value) {
              setState(() {
                email = value;
                print(email);
              });
            },
            validator: (value) {
              if (value == "") {
                return "Please Fill Email";
              } else if (!regExp.hasMatch(value)) {
                return "Email Is Invaild";
              }
              return "";
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            name: "Password",
            validator: (value) {
              if (value == "") {
                return "Please Fill Password";
              } else if (value.length < 8) {
                return "Password Is Too Short";
              }
              return "";
            },
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
