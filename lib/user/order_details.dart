import 'package:flutter/material.dart';

class DetailsOrder extends StatefulWidget {
  final String name;
  const DetailsOrder({required this.name, super.key});

  @override
  State<DetailsOrder> createState() => _DetailsOrderState();
}

class _DetailsOrderState extends State<DetailsOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
    );
  }
}
