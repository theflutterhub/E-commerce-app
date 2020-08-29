import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  String userName, userEmail, userGender, userPhoneNumber;
  UserModel(
      {@required this.userEmail,
      @required this.userGender,
      @required this.userName,
      @required this.userPhoneNumber});
}
