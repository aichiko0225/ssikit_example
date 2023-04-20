import 'package:flutter/material.dart';

class testRoutePage extends StatelessWidget {
  testRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test route'),),
      body: const Center(
        child: Text('new route'),
      ),
    );
  }
}
