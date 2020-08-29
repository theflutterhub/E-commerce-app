import 'package:e_commerce/model/usermodel.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:e_commerce/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProductProvider productProvider;
  File _pickedImage;
  PickedFile _image;
  Future<void> getImage({ImageSource source}) async {
    _image = await ImagePicker().getImage(source: source);
    if (_image != null) {
      _pickedImage = File(_image.path);
    }
  }

  Future<Map<String, String>> _uploadFile(File _image) async {
    String _imagePath = _image.path;

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${path.basename(_imagePath)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    StorageTaskSnapshot task = await uploadTask.onComplete;
    final String _imageUrl = (await task.ref.getDownloadURL());

    Map<String, String> _downloadData = {
      'imagePath': path.basename(_imagePath),
      'imageUrl': _imageUrl
    };
    return _downloadData;
  }

  Widget _buildSingleContainer({String startText, String endText}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
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

  Widget _buildSingleTextFormFlied({String name}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  bool edit = false;
  Widget _buildContainerPart() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
      children: userModel.map((e) {
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
              _buildSingleTextFormFlied(
                name: e.userName,
              ),
              _buildSingleTextFormFlied(
                name: e.userEmail,
              ),
              _buildSingleTextFormFlied(
                name: e.userGender,
              ),
              _buildSingleTextFormFlied(
                name: e.userPhoneNumber,
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
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
                  onPressed: () async {
                    var imageMap = await _uploadFile(_pickedImage);
                    print(imageMap["imagePath"]);
                  },
                ),
        ],
      ),
      body: Container(
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
                        backgroundImage: AssetImage("images/userImage.png"),
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
    );
  }
}
