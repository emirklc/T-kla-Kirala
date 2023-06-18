import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 3),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to register. Error: ${e.code}'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 0),
                  child: Container(
                    width: screenSize.width,
                    height: screenSize.height * .088,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: Colors.deepPurple.shade400.withOpacity(.75),
                      ),
                      color: Colors.deepPurple.shade400.withOpacity(.75),
                    ),
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 6, 253, 228))),
                          hintText: 'Eposta adresinizi giriniz   abcd@gmail.com',
                          labelText: 'Eposta',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(
                              color: Color.fromARGB(153, 255, 255, 255)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          suffixStyle: TextStyle(color: Colors.green)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 0),
                  child: Container(
                    width: screenSize.width,
                    height: screenSize.height * .088,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: Colors.deepPurple.shade400.withOpacity(.75),
                      ),
                      color: Colors.deepPurple.shade400.withOpacity(.75),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        hintText: 'Parola',
                        prefixText: ' ',
                        hintStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 0),
                  child: Container(
                    width: screenSize.width,
                    height: screenSize.height * .088,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: Colors.deepPurple.shade400.withOpacity(.75),
                      ),
                      color: Colors.deepPurple.shade400.withOpacity(.75),
                    ),
                    child: TextField(
                      controller: _confirmPasswordController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 6, 253, 228))),
                          hintText: 'Parolayı Tekrar Girin: ',
                          labelText: 'Parola Tekrar',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(
                              color: Color.fromARGB(153, 255, 255, 255)),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                          ),
                          suffixStyle: TextStyle(color: Colors.green)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String confirmPassword = _confirmPasswordController.text;

                    if (email.isNotEmpty && password.isNotEmpty && password == confirmPassword) {
                      register(email, password);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 154, 69, 197)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text(
                    "Kayıt ol",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
