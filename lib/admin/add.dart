import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  File? _image;
  String? _imagePath;
  String model = '';
  int year = 0;
  String km = '';
  String hp = '';
  String gear = '';
  String fuel = '';
  String price = '';

  void onSavePressed() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      FirebaseFirestore firestore = FirebaseFirestore.instance;

      if (_imagePath == null) {
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('No Image'),
            content: const Text('Please add an image.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        firestore.collection('AdminCars').add({
          'model': model,
          'year': year,
          'km': km,
          'hp': hp,
          'imagePath': _imagePath,
          'gear': gear,
          'fuel': fuel,
          'price': price,
        });

        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Saved'),
            content: const Text('Product was successfully saved.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileName = Path.basename(imageFile.path);
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$fileName');
    UploadTask uploadTask = storageReference.putFile(imageFile);

    await uploadTask;
    String imagePath = await storageReference.getDownloadURL();

    return imagePath;
  }

  Future<void> _uploadImage(File imageFile) async {
    try {
      String imagePath = await uploadImageToFirebase(imageFile);
      if (mounted) {
        setState(() {
          _imagePath = imagePath;
        });
      }
      print('Image uploaded successfully. URL: $_imagePath');
    } catch (error) {
      print('Image upload failed: $error');
    }
  }

  Future<void> _openCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final imageFile = File(image.path);
      _uploadImage(imageFile);
      setState(() {
        _image = imageFile;
      });
    }
  }

  Future<void> _openGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageFile = File(image.path);
      _uploadImage(imageFile);
      setState(() {
        _image = imageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text('Add Product', style: TextStyle(fontSize: 30)),
                const SizedBox(height: 50),
                TextButton.icon(
                  onPressed: _openCamera,
                  icon: const Icon(Icons.camera),
                  label: const Text('Camera'),
                ),
                TextButton.icon(
                  onPressed: _openGallery,
                  icon: const Icon(Icons.folder),
                  label: const Text('Gallery'),
                ),
                if (_image != null)
                  Image.file(_image!)
                else
                  Container(),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Model'),
                  onSaved: (value) {
                    model = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter model.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Year'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    year = int.parse(value!);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter year.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'KM'),
                  onSaved: (value) {
                    km = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter KM.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'HP'),
                  onSaved: (value) {
                    hp = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter HP.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Gear'),
                  onSaved: (value) {
                    gear = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter gear.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Fuel'),
                  onSaved: (value) {
                    fuel = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter fuel.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Price'),
                  onSaved: (value) {
                    price = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter price.';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: onSavePressed,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
