import 'dart:async';
import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:codeland/Screens/Login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final CameraDescription camera;

  Splash({required this.camera});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Login(
                  camera: widget.camera,
                )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
        246,
        131,
        38,
        1,
      ),
      body: Center(
        child: Container(
          width: 224,
          height: 324,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(0, 5.5 * 2))
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 16),
                child: Image.asset(
                    width: 180,
                    height: 180,
                    'Assets/4bde78399eceb04030d90b0be67ddb53.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Image.asset('Assets/copy.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
