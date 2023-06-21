import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/detail_page.dart';
import 'navigationBar_Page.dart';

class Car {
  final String model;
  final int year;
  final int price;
  final String imageUrl;
  final String fuel;
  final String gear;
  final int km;
  final int hp;

  Car(
    this.model,
    this.year,
    this.price,
    this.imageUrl,
    this.fuel,
    this.gear,
    this.km,
    this.hp,
  );

  Car.fromDocument(DocumentSnapshot doc)
      : model = (doc.data() as Map<String, dynamic>).containsKey('model') ? doc['model'] : '',
        year = (doc.data() as Map<String, dynamic>).containsKey('year') ? doc['year'] : 0,
        price = (doc.data() as Map<String, dynamic>).containsKey('price') ? doc['price'] : 0,
        imageUrl = (doc.data() as Map<String, dynamic>).containsKey('imageUrl') ? doc['imageUrl'] : '',
        fuel = (doc.data() as Map<String, dynamic>).containsKey('fuel') ? doc['fuel'] : '',
        gear = (doc.data() as Map<String, dynamic>).containsKey('gear') ? doc['gear'] : '',
        km = (doc.data() as Map<String, dynamic>).containsKey('km') ? doc['km'] : 0,
        hp = (doc.data() as Map<String, dynamic>).containsKey('hp') ? doc['hp'] : 0;


}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('AdminCars').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Bir hata oluştu'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final carDocs = snapshot.data!.docs;
                final cars = carDocs.map((doc) => Car.fromDocument(doc)).toList();

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: cars.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
  cars[index].imageUrl,
  height: 110,
  width: 120,
  fit: BoxFit.contain,
  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    // You can return any widget here to display in case of error.
    return const Center(child: Text('Error loading image'));
  },
),
                            Text(
                              cars[index].model,
                              style: const TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              cars[index].price.toString(),
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
                                        builder: (context) => DetailPage(cars[index]),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
