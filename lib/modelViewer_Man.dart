/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

//void main() => runApp(const MyApp());

class ModelScreen extends StatelessWidget {
  double weight;
  double height;

  ModelScreen({required this.weight, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Model Viewer")),
        body: ModelViewer(
          scale: "1.0 $height $weight", //좌우 위아래 앞뒤
          backgroundColor: Colors.white, // a bundled asset file
          alt: "A 3D model of an astrote",
          src: 'assets/egg_guy.glb',
          ar: true,
          arModes: const ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: true,
          cameraControls: true,
          iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          disableZoom: true,
        ),
      ),
    );
  }
}
