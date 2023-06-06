import 'package:flutter/material.dart';
import 'package:flutter_application_2/animation_Page.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:flutter_application_2/login_page.dart';
import 'package:flutter_application_2/tarih.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: CarAnimationScreen(),
    );
  }
}



