import 'package:camera/camera.dart';
import 'package:codeland/Screens/Login.dart';
import 'package:codeland/Screens/upload%20image.dart';
import 'package:flutter/material.dart';

import 'Screens/Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(Main(camera: firstCamera));
}

class Main extends StatelessWidget {
  final CameraDescription camera;
   Main({required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: Splash(camera: camera,),);
  }
}

