import 'package:flutter/material.dart';

class BackgroundMusic extends StatefulWidget {
  const BackgroundMusic({super.key});

  @override
  State<BackgroundMusic> createState() => _BackgroundMusicState();
}

class _BackgroundMusicState extends State<BackgroundMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Music Page is under dev"),),
    );
  }
}