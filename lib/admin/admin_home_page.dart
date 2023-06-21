import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin/add.dart';
import 'package:flutter_application_2/login_page.dart';




class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final Stream<QuerySnapshot> _carsStream =
      FirebaseFirestore.instance.collection('AdminCars').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: (

                    ) {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage() ));
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Admin Cars",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _carsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final cars = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: cars.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> carData = cars[index]
                          .data() as Map<String, dynamic>;

                      return Card(
                        child: ListTile(
                          leading: carData.containsKey('imageUrl') &&
                                  carData['imageUrl'] != null
                              ? Image.network(
                                  carData['imageUrl'],
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                )
                              : const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                          title: Text(carData['model']),
                          subtitle: Text("Year: " + carData['year'].toString()),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}