import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin/add.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference cars = FirebaseFirestore.instance.collection('AdminCars');

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: cars.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return FutureBuilder<String>(
                future: getImageUrl(data['imagePath']),
                builder: (BuildContext context, AsyncSnapshot<String> urlSnapshot) {
                  if (urlSnapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (urlSnapshot.hasError) {
                    return Icon(Icons.error);
                  }

                  String imageUrl = urlSnapshot.data ?? '';

                  return Card(
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      title: Text(data['model']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Year: ${data['year'].toString()}'),
                          Text('KM: ${data['km']}'),
                          Text('HP: ${data['hp']}'),
                          Text('Gear: ${data['gear']}'),
                          Text('Fuel: ${data['fuel']}'),
                          Text('Price: ${data['price']}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
      ),
    );
  }

  Future<String> getImageUrl(String? imagePath) async {
  if (imagePath == null) {
    // Image path is null, return an error message or appropriate value
    return 'No Image';
  }

  try {
    final Reference storageReference = FirebaseStorage.instance.ref().child(imagePath);
    final String imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
  } catch (error) {
    print('Error getting image URL: $error');
    return 'Failed to load image';
  }
}
}




/*import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin/add.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference cars = FirebaseFirestore.instance.collection('AdminCars');

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
     body: StreamBuilder<QuerySnapshot>(
        stream: cars.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return FutureBuilder<String>(
                future: getImageUrl(data['imagePath']),
                builder: (BuildContext context, AsyncSnapshot<String> urlSnapshot) {
                  if (urlSnapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (urlSnapshot.hasError) {
                    return Icon(Icons.error);
                  }

                  String imageUrl = urlSnapshot.data ?? '';

                  return Card(
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      title: Text(data['model']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Year: ${data['year'].toString()}'),
                          Text('KM: ${data['km']}'),
                          Text('HP: ${data['hp']}'),
                          Text('Gear: ${data['gear']}'),
                          Text('Fuel: ${data['fuel']}'),
                          Text('Price: ${data['price']}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
      ),
    );
  }

  Future<String> getImageUrl(String? imagePath) async {
  if (imagePath == null) {
    // Image path is null, return an error message or appropriate value
    return 'No Image';
  }

  try {
    final Reference storageReference = FirebaseStorage.instance.ref().child(imagePath);
    final String imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
  } catch (error) {
    print('Error getting image URL: $error');
    return 'Failed to load image';
  }
}
}*/