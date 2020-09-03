import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/cartmodel.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> feature = [];
  Product featureData;
  List<CartModel> cartModelList = [];
  CartModel cartModel;
  List<CartModel> checkOutModelList = [];
  CartModel checkOutModel;
  List<CartModel> myCheckOut;
  List<UserModel> userModelList = [];
  UserModel userModel;
  Future<void> getUserData() async {
    List<UserModel> newList = [];
    User currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("User").get();
    userSnapShot.docs.forEach(
      (element) {
        if (currentUser.uid == element.data()["UserId"]) {
          userModel = UserModel(
            userImage: element.data()["UserImage"],
              userEmail: element.data()["UserEmail"],
              userGender: element.data()["UserGender"],
              userName: element.data()["UserName"],
              userPhoneNumber: element.data()["UserNumber"]);
          newList.add(userModel);
        }
        userModelList = newList;
      },
    );
  }

  List<UserModel> get getUserModelList {
    return userModelList;
  }

  void getCheckOutData({
    int quentity,
    double price,
    String name,
    String image,
  }) {
    checkOutModel = CartModel(
      price: price,
      name: name,
      image: image,
      quentity: quentity,
    );
    checkOutModelList.add(checkOutModel);
  }

  List<CartModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

  void getCartData({
    String name,
    String image,
    int quentity,
    double price,
  }) {
    cartModel = CartModel(
      price: price,
      name: name,
      image: image,
      quentity: quentity,
    );
    cartModelList.add(cartModel);
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  int get getCartModelListLength {
    return cartModelList.length;
  }

  Future<void> getFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("hfPmMokn0tbAuGZvRMy1")
        .collection("featureproduct")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(featureData);
      },
    );
    feature = newList;
  }

  List<Product> get getFeatureList {
    return feature;
  }

  List<Product> homeFeature = [];

  Future<void> getHomeFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot =
        await FirebaseFirestore.instance.collection("homefeature").get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(featureData);
      },
    );
    homeFeature = newList;
    notifyListeners();
  }

  List<Product> get getHomeFeatureList {
    return homeFeature;
  }

  List<Product> homeAchive = [];

  Future<void> getHomeAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot =
        await FirebaseFirestore.instance.collection("homeachive").get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(featureData);
      },
    );
    homeAchive = newList;
    notifyListeners();
  }

  List<Product> get getHomeAchiveList {
    return homeAchive;
  }

  List<Product> newAchives = [];
  Product newAchivesData;
  Future<void> getNewAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot achivesSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("hfPmMokn0tbAuGZvRMy1")
        .collection("newachives")
        .get();
    achivesSnapShot.docs.forEach(
      (element) {
        newAchivesData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(newAchivesData);
      },
    );
    newAchives = newList;
    notifyListeners();
  }

  List<Product> get getNewAchiesList {
    return newAchives;
  }

  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }
}
