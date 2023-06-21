













/*import 'package:flutter/material.dart';


import 'package:flutter_svg/flutter_svg.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  String _pickupDate = '';
  String _returnDate = '';
  String _pickupTime = '';
  String _returnTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Araç Kiralama'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SvgPicture.network(
                'https://www.example.com/car-image.svg',
                height: 200.0,
              ),
              SizedBox(height: 20),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Alış Tarihi',
                timeLabelText: "Saat",
                selectableDayPredicate: (date) {
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }
                  return true;
                },
                onChanged: (val) => setState(() => _pickupDate = val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => setState(() => _pickupDate = val),
              ),
              SizedBox(height: 20),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Dönüş Tarihi',
                timeLabelText: "Saat",
                selectableDayPredicate: (date) {
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }
                  return true;
                },
                onChanged: (val) => setState(() => _returnDate = val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => setState(() => _returnDate = val),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Araçları Listele"),
                onPressed: () {
                  // Araçları listeleme işlemi yapılacak
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/