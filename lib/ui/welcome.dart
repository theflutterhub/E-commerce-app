import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  Widget _buildTextformFliedPart() {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(color: Colors.white, fontSize: 17),
          decoration: InputDecoration(
            labelText: "Login",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[350], width: 1),
            ),
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        TextFormField(
          obscureText: true,
          style: TextStyle(color: Colors.white, fontSize: 17),
          decoration: InputDecoration(
            labelText: "Password",
            focusColor: Colors.white,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[350], width: 1),
            ),
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _topText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white,
                fontSize: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Text(
          "Start And End In Rome! With the in-depth cultural",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        Text(
          "tour best of italy (16 destinations), you",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45,
          width: 150,
          child: RaisedButton(
            child: Text(
              "SignUp",
              style: TextStyle(color: Colors.white),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Color(0xffff907a),
            onPressed: () {},
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: Image(
                color: Color(0xff60afaa),
                image: AssetImage(
                  "images/facebook.png",
                ),
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: Image(
                color: Color(0xff60afaa),
                image: AssetImage(
                  "images/twitter.png",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("images/welcome.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _topText(),
                  _buildTextformFliedPart(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildBottomPart(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
