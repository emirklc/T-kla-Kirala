import 'package:flutter/material.dart';

 class HistoryPage extends StatefulWidget {
  
  final String? startDate;
  final String? endDate;
  final String? name;
  final String? surname;
  final String? birthDate;
  final String? tc;

   HistoryPage({
     this.startDate,
     this.endDate,
     this.name,
     this.surname,
     this.birthDate,
     this.tc,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: const Text(
          "Geçmiş Kiralamalar",
        ),
        centerTitle: true,
      ),
      body: Card(
            child: Container(
              decoration: BoxDecoration( border: Border.all(
          color: Colors.deepPurple.shade500,
          width: 2,),
          borderRadius: BorderRadius.circular(13)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Container(
                  color: Colors.white10,
                  width: screenSize.width,
                  height: screenSize.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ad:",
                    style: TextStyle(
                      color: Colors.deepPurple.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Soy isim:",
                    style: TextStyle(
                      color: Colors.deepPurple.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.surname}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Doğum Tarihi:",
                    style: TextStyle(
                      color: Colors.deepPurple.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.birthDate}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "TC Kimlik No:",
                    style: TextStyle(
                      color: Colors.deepPurple.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.tc}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Başlangıç Tarihi:",
                    style: TextStyle(
                      color: Colors.deepPurple.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.startDate}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Bitiş Tarihi:",
                    style: TextStyle(
                      color: Colors.deepPurple.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.endDate}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                      ],
                    ),
                  ),
                ),),
            ),),);
  }
}
