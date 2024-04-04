import 'package:camera/camera.dart';
import 'package:codeland/Screens/upload%20image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  final CameraDescription camera;

  Login({required this.camera});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset('Assets/copy.png')),
            Padding(
              padding: const EdgeInsets.only(top: 101),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                      width: 180,
                      height: 180,
                      'Assets/4bde78399eceb04030d90b0be67ddb53.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 288),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Biomedical  Kiosk',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 369, left: 30, right: 30),
              child: TextFormField(
                cursorColor: Colors.blue,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 444, left: 30, right: 30),
              child: TextFormField(
                cursorColor: Colors.blue,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageUp(
                        camera: widget.camera,
                      ),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 527, left: 30, right: 30),
                child: Container(
                  width: double.maxFinite,
                  height: 56,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(
                        246,
                        131,
                        38,
                        1,
                      ),
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 5,
                          offset: Offset(0, 8),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Center(
                      child: Text('Login'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 639, left: 40),
              child: Text(
                'For Assistance & Login Details Contact: ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 661, left: 40),
              child: Row(
                children: [
                  Text(
                    'English, Kannada & Telugu : ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    ' 7406333800',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(
                        246,
                        131,
                        38,
                        1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 683, left: 40),
              child: Row(
                children: [
                  Text(
                    'English, Kannada & Hindi    : ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    ' 9071386515',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(
                        246,
                        131,
                        38,
                        1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 784, bottom: 30),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'v1.7 © 2023,Codeland Infosolutions Pvt Ltd.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
