import 'package:flutter/material.dart';

class clockPage extends StatefulWidget {
  const clockPage({super.key});

  @override
  State<clockPage> createState() => _clockPageState();
}

class _clockPageState extends State<clockPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Clock"),),
    );
  }
}