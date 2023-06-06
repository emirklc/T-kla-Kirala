import 'package:flutter/material.dart';
import 'package:flutter_application_2/detail_page.dart';

import 'navigationBar_Page.dart';

class Car {
  final String make;
  final String model;
  final int year;
  final String fiyat;
  final String imagePath;
  final String yakit;
  final String vites;
  final String km;
  final String hp;

  Car(this.make, this.model, this.year, this.fiyat, this.imagePath, this.yakit, this.vites, this.km, this.hp);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Car> carList = [
    Car("Renault", "Clio", 2021, "1000", "assets/images/clio.png", "Dizel", "Manuel", "45000", "95 hp"),
    Car("Volkswagen", "Passat", 2019, "2000", "assets/images/passat.png", "Dizel", "Otomatik", "60000", "132 hp"),
    Car("Peugeot", "508", 2020, "1500", "assets/images/peugeot3008.png", "Dizel", "Otomatik", "100000", "145 hp"),
    Car("Peugeot", "208", 2022, "1500", "assets/images/208.png", "Dizel", "Otomatik", "50000", "130 hp"),
    Car("Renault", "Megane", 2021, "1200", "assets/images/clio.png", "Benzin", "Manuel", "120000", "90 hp"),
    Car("Ford", "Focus", 2020, "1600", "assets/images/focus.png", "Dizel", "Manuel", "70000", "120 hp"),
    Car("Opel", "Astra", 2018, "1800", "assets/images/astra.png", "Dizel", "Otomatik", "10000", "110 hp"),
    Car("Jeep", "Cherokee", 2019, "3000", "assets/images/jeep.png", "Dizel", "Otomatik", "25000", "348 hp"),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
   
   return Scaffold(
    bottomNavigationBar: BottomNavigationBarWidget(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0),
            child: Row(
              children: [
                
                const SizedBox(width: 10),
                const Text(
                  "Araçlar",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: carList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          carList[index].imagePath,
                          height: 110,
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          carList[index].make,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          carList[index].fiyat,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: SizedBox(
                            height: 36,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(carList[index]),
                                  ),
                                );
                              },
                              color: Colors.black87,
                              child: const Text(
                                "Kirala",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
