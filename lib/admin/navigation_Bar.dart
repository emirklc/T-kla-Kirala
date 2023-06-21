

import 'package:flutter/material.dart';

import 'package:flutter_application_2/admin/add.dart';
import 'package:flutter_application_2/admin/admin_home_page.dart';
import 'package:flutter_application_2/admin/admin_setting.dart';


class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  State<NavigationBarPage> createState() =>
      _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  
  @override
    int selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);

  void onItemTapped(int index) {

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget child = Container();
    if (selectedIndex == 0) {
      child = AdminHomePage ();
    }
    else if(selectedIndex == 1)
      {
        child = AddPage();
      }
    else if(selectedIndex == 2)
      {
        child = AdminSettingScreen();
      }
   

    // TODO: implement build
    return Scaffold(

        body: SizedBox.expand(
          child: SizedBox.expand(
            child: child,
          ),
        ),
        bottomNavigationBar: bottomTab()
    );
  }

  Widget bottomTab() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.electric_car_rounded),
            label: 'Arabalar'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ekle'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Hesabım'
        ),
        
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.green[400],
      onTap: onItemTapped,
    );
  }}