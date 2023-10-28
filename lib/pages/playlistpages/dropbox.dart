import 'package:flutter/material.dart';

class DropBoxInt extends StatefulWidget {
  const DropBoxInt({super.key});

  @override
  State<DropBoxInt> createState() => _DropBoxIntState();
}

class _DropBoxIntState extends State<DropBoxInt> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Dropbox"),),
    );
  }
}