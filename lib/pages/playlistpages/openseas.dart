import 'package:flutter/material.dart';

class OpenSeasInt extends StatefulWidget {
  const OpenSeasInt({super.key});

  @override
  State<OpenSeasInt> createState() => _OpenSeasIntState();
}

class _OpenSeasIntState extends State<OpenSeasInt> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Openseas"),),
    );
  }
}