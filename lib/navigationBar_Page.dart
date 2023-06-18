import 'package:flutter/material.dart';
import 'package:flutter_application_2/account.dart';
import 'package:flutter_application_2/history.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:flutter_application_2/login_page.dart';
import 'package:flutter_application_2/setting.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor:Colors.white,
      selectedItemColor:Colors.blueGrey,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: (value) {
        setState(() => _currentIndex = value);
        value == 0
            ? Navigator.push(
              context, MaterialPageRoute(builder: (context) =>HomePage()))
            : value == 1
                ? Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HistoryPage()))
                : Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
      },
      items: const [
        BottomNavigationBarItem(
          
          label: "Anasayfa",
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: "Geçmiş",
          icon: Icon(Icons.access_time_sharp),
        ),
        BottomNavigationBarItem(
          label: "Ayarlar",
          icon: Icon(Icons.settings),
        ),
        
      ],
    );
  }
}