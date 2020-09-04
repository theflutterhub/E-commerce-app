import 'package:e_commerce/projectscreen/tiktokui.dart';
import 'package:e_commerce/projectscreen/whatsappui.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/screens/welcomescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(iconTheme: IconThemeData(color: Colors.black)),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return WelcomeScreen();
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return Login();
            }
          },
        ),

      ),
    );
  }
}
