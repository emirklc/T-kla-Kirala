import 'package:flutter/material.dart';
import 'package:flutter_application_2/navigationBar_Page.dart';
import 'package:flutter_application_2/rent.dart';

import 'home_page.dart';

class DetailPage extends StatefulWidget {
 
  final Car car;
  DetailPage(this.car);

  @override
  _DetailPage createState() => _DetailPage();

}

class _DetailPage extends State<DetailPage>{
 
  
  @override
  void initState(){
  
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: BottomNavigationBarWidget(),
      backgroundColor: Colors.deepPurple.shade400,
      body: Stack(
        fit:StackFit.expand,
        children: [
        Positioned(
          top: 40,
          left: 15,
          child: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 100,
          left: 15,
          child: Text(
            widget.car.model,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
          ),
        ),
        Positioned( 
          top: 340,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            width: 412,
            height: 600,
          ),
        ),
        Positioned(
  left: 70,
  top: 220,
  child: Container(
    width: 300,
    height: 210,
    child: Image.network(
      widget.car.imageUrl,
      fit: BoxFit.cover,
    ),
  ),
),
      
        Positioned(
  top: 435,
  left: 60,
  child: Container(
    width: 200,
    height: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(Icons.calendar_today), // Yeni eklenen icon
            SizedBox(width: 8), // Icon ve text arasındaki boşluk
            Text(
              "Yıl: ${widget.car.year}",
              style: const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.local_gas_station), // Yeni eklenen icon
            SizedBox(width: 8), // Icon ve text arasındaki boşluk
            Text("Yakıt: ${widget.car.fuel}",
                style:
                    const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.swap_calls), // Yeni eklenen icon
            SizedBox(width: 8), // Icon ve text arasındaki boşluk
            Text("Vites: ${widget.car.gear}",
                style:
                    const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.speed), // Yeni eklenen icon
            SizedBox(width: 8), // Icon ve text arasındaki boşluk
            Text("KM: ${widget.car.km}",
                style:
                    const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.power), // Yeni eklenen icon
            SizedBox(width: 8), // Icon ve text arasındaki boşluk
            Text("Motor Gücü: ${widget.car.hp}",
                style:
                    const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    ),
  ),
),

        Positioned(
  right: 100,
  bottom: 40,
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RentCarPage(),
        ),
      );
    },
    child: Container(
      width: 200,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "Kirala",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ),
  ),
)

      ]),
    );
  
  }
  

}

