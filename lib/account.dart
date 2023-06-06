import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        centerTitle: true,
        title: Text("Hesap Bilgileri"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.black),
                ),
                width: 175,
                height: 175,
                child: Image.network("https://i.guim.co.uk/img/media/acb1627786c251362c4bc87c1f53fa39b49d8d3d/0_0_1368_1026/master/1368.jpg?width=700&quality=85&auto=format&fit=max&s=c52b1a992e81637f35b291fbc23ae860"
                  ,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "ID: 10109731288",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Ad: Emir",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Soyad: Kılıç",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Mail: emir@gmail.com",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}