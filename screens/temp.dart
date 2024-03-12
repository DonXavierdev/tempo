import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? data = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text(data ?? 'No data received'),
      ),
    );
  }
}
