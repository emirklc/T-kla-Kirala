import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_page.dart';

class CarAnimationScreen extends StatefulWidget {
  @override
  State<CarAnimationScreen> createState() => _CarAnimationScreenState();
}

class _CarAnimationScreenState extends State<CarAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: -1, end: 2),
        duration: Duration(seconds: 4),
        builder: (context, value, child) {
          return Stack(
            children: [
              Align(
                alignment: Alignment(value, 0),
                child: Image.asset(
                  'assets/images/animation.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              if (value >= 1)
                FutureBuilder(
                  future: Future.delayed(Duration.zero),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      return HomePage();
                    }
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}


