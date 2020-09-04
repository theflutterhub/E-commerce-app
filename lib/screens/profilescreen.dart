import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/usermodel.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:e_commerce/widgets/mytextformField.dart';
import 'package:e_commerce/widgets/notification_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController phoneNumber;
  TextEditingController userName;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  bool isMale = false;
  void vaildation() async {
    if (userName.text.isEmpty && phoneNumber.text.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
        ),
      );
    } else if (userName.text.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Name Is Empty "),
        ),
      );
    } else if (userName.text.length < 6) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
    } else if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    } else {
      _uploadImage(image: _pickedImage);
      userDetailUpdate();
    }
  }

  ProductProvider productProvider;
  void userDetailUpdate() {
    FirebaseFirestore.instance.collection("User").doc(user.uid).update({
      "UserName": userName.text,
      "UserGender": isMale == true ? "Male" : "Female",
      "UserNumber": phoneNumber.text,
      "UserImage":imageUrl,
    });
  }

  File _pickedImage;

  PickedFile _image;
  Future<void> getImage({ImageSource source}) async {
    _image = await ImagePicker().getImage(source: source);
    if (_image != null) {
      _pickedImage = File(_image.path);
    }
  }

  User user;
  String imageUrl;
  void _uploadImage({File image}) async {
    user = FirebaseAuth.instance.currentUser;
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child("UserImage/${user.uid}");
    StorageUploadTask uploadTask = storageReference.putFile(image);
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    imageUrl = await snapshot.ref.getDownloadURL();
  }

  Widget _buildSingleContainer(
      {Color color, String startText, String endText}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: edit == true ? color : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startText,
              style: TextStyle(fontSize: 17, color: Colors.black45),
            ),
            Text(
              endText,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
String userImage;
  bool edit = false;
  Widget _buildContainerPart() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
      children: userModel.map((e) {
        userImage=e.userImage;
        userName = TextEditingController(text: e.userName);
        phoneNumber = TextEditingController(text: e.userPhoneNumber);
        if (e.userGender == "Male") {
          setState(() {
            isMale = true;
          });
        } else {
          setState(() {
            isMale = false;
          });
        }

        return Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleContainer(
                endText: e.userName,
                startText: "Name",
              ),
              _buildSingleContainer(
                endText: e.userEmail,
                startText: "Email",
              ),
              _buildSingleContainer(
                endText: e.userGender,
                startText: "Gender",
              ),
              _buildSingleContainer(
                endText: e.userPhoneNumber,
                startText: "Phone Number",
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Pick Form Camera"),
                    onTap: () {
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Pick Form Gallery"),
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTextFormFliedPart() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
      children: userModel.map((e) {
        return Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextFormField(
                name: "UserName",
                controller: userName,
              ),
              _buildSingleContainer(
                color: Colors.grey[300],
                endText: e.userEmail,
                startText: "Email",
              ),
              _buildSingleContainer(
                color: Colors.white,
                endText: e.userGender,
                startText: "Gender",
              ),
              MyTextFormField(
                name: "Phone Number",
                controller: phoneNumber,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(isMale);
    productProvider = Provider.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black45,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => HomePage(),
                      ),
                    );
                  });
                },
              ),
        backgroundColor: Colors.white,
        actions: [
          edit == false
              ? NotificationButton()
              : IconButton(
                  icon: Icon(
                    Icons.check,
                    size: 30,
                    color: Color(0xff746bc9),
                  ),
                  onPressed: () {
                    vaildation();
                  },
                ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          maxRadius: 65,
                          backgroundImage: userImage == null
                              ? AssetImage("images/userImage.png")
                              : NetworkImage(userImage),
                        ),
                      ],
                    ),
                  ),
                  edit == true
                      ? Padding(
                          padding: const EdgeInsets.only(left: 225, top: 80),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                              onTap: () {
                                myDialogBox(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Color(0xff746bc9),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 300,
                      child: edit == true
                          ? _buildTextFormFliedPart()
                          : _buildContainerPart(),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: 200,
                  child: edit == false
                      ? MyButton(
                          name: "Edit Profile",
                          onPressed: () {
                            setState(() {
                              edit = true;
                            });
                          },
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
