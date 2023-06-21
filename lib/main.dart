import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin/admin_home_page.dart';
import 'package:flutter_application_2/animation_Page.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:flutter_application_2/login_page.dart';
import 'package:flutter_application_2/rent.dart';


import 'admin/add.dart';
import 'admin/admin_Login_Page.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       
      home: HomePage());
    
  }
}



