import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/widgets/changescreen.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:e_commerce/widgets/mytextformField.dart';
import 'package:e_commerce/widgets/passwordtextformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email;
String phoneNumber;
bool isMale = true;
String password;
String userName;

class _SignUpState extends State<SignUp> {
  void vaildation() async {
    final FormState _form = _formKey.currentState;
    if (!_form.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        FirebaseFirestore.instance.collection("User").doc(result.user.uid).set({
          "UserName": userName,
          "UserId": result.user.uid,
          "UserEmail": email,
          "UserGender": isMale == true ? "Male" : "Female",
          "Phone Number": phoneNumber,
        });
      } on PlatformException catch (e) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
    } else {}
  }

  Widget _buildAllTextFormField() {
    return Expanded(
      flex: 1,
      child: Container(
        height: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyTextFormField(
              name: "UserName",
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill UserName";
                } else if (value.length < 6) {
                  return "UserName Is Too Short";
                }

                return "";
              },
            ),
            MyTextFormField(
              name: "Email",
              onChanged: (value) {
                setState(() {
                  email = value;
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
              name: "Password",
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
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
            GestureDetector(
              onTap: () {
                setState(() {
                  isMale = !isMale;
                });
              },
              child: Container(
                height: 60,
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        isMale == true ? "Male" : "Female",
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MyTextFormField(
              name: "Phone Number",
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill Phone Number";
                } else if (value.length < 11) {
                  return "Phone Number Must Be 11";
                }
                return "";
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 460,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: "SignUp",
            onPressed: () {
              vaildation();
            },
          ),
          ChangeScreen(
            name: "Login",
            whichAccount: "I Have Already An Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Login(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 280,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
