import 'package:flutter/material.dart';
import 'package:flutter_application_2/login_page.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: LoginPage(),
    );
  }
}



