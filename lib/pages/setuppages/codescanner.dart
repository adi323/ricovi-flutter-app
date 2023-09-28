import 'package:flutter/material.dart';

class Codescanner extends StatefulWidget {
  const Codescanner({super.key});

  @override
  State<Codescanner> createState() => _CodescannerState();
}

class _CodescannerState extends State<Codescanner> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Code Scanner in development")
      ),
    );
  }
}