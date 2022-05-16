import 'package:flutter/material.dart';

class CalendarScreenWidget extends StatelessWidget {
    const CalendarScreenWidget({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Calendar'),
        ),
        body: Column(),
      );
    }
  }
