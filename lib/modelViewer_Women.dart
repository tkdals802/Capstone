/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

//void main() => runApp(const MyApp());

class ModelScreen2 extends StatelessWidget {
  double weight;
  double height;

  ModelScreen2({required this.weight, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Model Viewer")),
        body: ModelViewer(
          scale: "$height 1.0 $weight", //좌우 위아래 앞뒤
          backgroundColor: Colors.white, // a bundled asset file
          alt: "A 3D model of an astrote",
          src: 'assets/yellow_girl.glb',
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
