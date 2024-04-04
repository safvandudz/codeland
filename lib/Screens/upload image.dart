import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'camara.dart';

class ImageUp extends StatefulWidget {
  final CameraDescription camera;

  ImageUp({
    required this.camera,
  });

  @override
  State<ImageUp> createState() => _ImageUpState();
}

class _ImageUpState extends State<ImageUp> {
  String? _capturedImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'upload a image',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
            ),
            GestureDetector(
              onTap: () async {
                _capturedImagePath = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(camera: widget.camera),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 118, left: 40, right: 40),
                child: Container(
                    width: double.maxFinite,
                    height: 509,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Colors.black,
                      strokeWidth: 1,
                      dashPattern: [8, 5],
                      padding: EdgeInsets.zero,
                      child: Center(
                        child: Image.asset(
                            'Assets/e9a99d78d5d1deefa5d9206ee19ead0e.png'),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 701, left: 24, right: 24, bottom: 30),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 119,
                        height: 35,
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
                        child: Center(
                          child: Text('Upload'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 119,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(17),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5,
                                  offset: Offset(0, 8),
                                )
                              ]),
                          child: Center(
                            child: Text('View'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
