import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watches extends StatefulWidget {
  const Watches({super.key});

  @override
  State<Watches> createState() => _WatchesState();
}

class _WatchesState extends State<Watches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watches'),
        centerTitle: true,
      ),
    );
  }
}
