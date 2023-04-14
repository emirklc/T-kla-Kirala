import 'package:flutter/material.dart';
import 'package:flutter_application_2/history.dart';


class RentCarPage extends StatefulWidget {
  @override
  _RentCarPageState createState() => _RentCarPageState();
}

class _RentCarPageState extends State<RentCarPage> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();
void initState() {
  super.initState();
  _startDate =DateTime.now();
  _endDate =DateTime.now();
 }
  late DateTime _startDate;
  late DateTime _endDate;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
        _startDateController.text = picked.toString();
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
        _endDateController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        title: const Text("Rental Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(labelText: "Surname"),
              ),
              TextFormField(
                controller: _birthDateController,
                decoration: const InputDecoration(labelText: "Birth Date"),
              ),
              TextFormField(
                controller: _tcController,
                decoration: const InputDecoration(labelText: "TC Number"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                onTap: () => _selectStartDate(context),
                readOnly: true,
                controller: _startDateController,
                decoration: const InputDecoration(labelText: "Start Date"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                onTap: () => _selectEndDate(context),
                readOnly: true,
                controller: _endDateController,
                decoration: InputDecoration(labelText: "End Date"),
              ),
              const SizedBox(
                height: 32.0,
              ),
              ElevatedButton(
  onPressed: () {
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => HistoryPage(
      startDate: _startDateController.text,
      endDate: _endDateController.text,
      name: _nameController.text,
      surname: _surnameController.text,
      birthDate: _birthDateController.text,
      tc: _tcController.text,
    ),
  ),
);

  },
  style: ElevatedButton.styleFrom(
    primary: Colors.deepPurple.shade400,
  ),
  child: const Text("kirala"),
)
            ],
          ),
        ),
      ),
    );
  }
}





