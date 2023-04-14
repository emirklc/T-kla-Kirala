import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
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
                  //padding: EdgeInsets.symmetric(horizontal: 15),
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
                    child: const TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
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
                  //padding: EdgeInsets.symmetric(horizontal: 15),
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
                    child: const TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: InputDecoration(
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
                  //padding: EdgeInsets.symmetric(horizontal: 15),
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
                    child: const TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
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
                ElevatedButton(onPressed:(){ Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),),);

                },
                style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 154, 69, 197)), // butonun arka plan rengi
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // butonun metin rengi
  ),
                 child: Text("Kayıt ol",style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
