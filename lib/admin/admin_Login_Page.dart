import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin/navigation_Bar.dart';
import 'package:flutter_application_2/animation_Page.dart';
import '../home_page.dart';
import '../register_page.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigationBarPage()),
      );
    } on FirebaseAuthException catch (e) {
      // handle error according to the error code
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: size.height * .5,
            width: size.width * .85,
            decoration: BoxDecoration(
                color: Colors.pink.withOpacity(.75),
                borderRadius: BorderRadius.all(const Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.75),
                      blurRadius: 10,
                      spreadRadius: 2)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                        controller: _emailController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          hintText: 'E-Mail',
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
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                          ),
                          hintText: 'Parola',
                          prefixText: ' ',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Hesabın yok mu?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        MaterialButton(
                            child: const Text(
                              'Kaydol',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            }),
                             MaterialButton(
                            child: const Text(
                              'admin giriş',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            }),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String? email = _emailController.text;
                        String? password = _passwordController.text;
    
                        if (email != null && email.isNotEmpty && password != null && password.isNotEmpty) {
                          signIn(email, password);
                        } else {
                          // Show an error message to the user
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Hata"),
                                content: const Text("E-mail ve parola alanları boş bırakılamaz."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('Tamam'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(
                          color: Colors.deepPurple.shade400,
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
