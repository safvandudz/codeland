import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  CameraScreen({required this.camera});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  XFile? _capturedImage;
  bool _isFlashOn = false;
  String? _savedImagePath;

  @override
  void initState() {
    super.initState();
    _initializeCameraController();
  }

  void _initializeCameraController() async {
    try {
      _controller = CameraController(widget.camera, ResolutionPreset.medium);
      await _controller.initialize();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print("Error initializing camera controller: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_controller),
          if (_capturedImage != null)
            Positioned(
              bottom: 10,
              left: 10,
              child: Image.file(
                File(_capturedImage!.path),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _toggleFlash(),
            child: _isFlashOn ? Icon(Icons.flash_off) : Icon(Icons.flash_on),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => _captureImage(),
            child: Icon(Icons.camera),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _capturedImage != null ? () => _saveImageAndNavigate(context) : null,
            child: Icon(Icons.save),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _capturedImage != null ? _retakePicture : null,
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  void _toggleFlash() {
    setState(() {
      _isFlashOn = !_isFlashOn;
    });

    _controller.setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
  }
  void _captureImage() async {
    try {
      XFile image = await _controller.takePicture();
      setState(() {
        _capturedImage = image;
      });

      if (_capturedImage != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Image.file(
                File(_capturedImage!.path),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _saveImageAndNavigate(context);
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }


  void _saveImageAndNavigate(BuildContext context) {
    try {
      if (_capturedImage != null) {

        setState(() {
          _savedImagePath = _capturedImage!.path;
          Navigator.pop(context, _savedImagePath);
        });


      }
    } catch (e) {
      print("Error saving image: $e");
    }
  }

  void _retakePicture() {
    setState(() {
      _capturedImage = null;
    });
  }
}
