import 'package:flutter/material.dart';

class UserModel {
  String userName,
      userEmail,
      userGender,
      userPhoneNumber,
      userImage,
      userAddress;
  UserModel(
      {@required this.userEmail,
      @required this.userImage,
      @required this.userAddress,
      @required this.userGender,
      @required this.userName,
      @required this.userPhoneNumber});
}
