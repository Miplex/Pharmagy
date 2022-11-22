import 'package:flutter/material.dart';

class ClockScreenWidget extends StatelessWidget {
  const ClockScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock'),
      ),
      body: Column(
        children:  const [
         Text('Hello'),
        ],
      ),
    );
  }
}
