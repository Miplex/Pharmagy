import 'package:flutter/material.dart';
import 'package:pharmagy/screens/home_screen/widgets/bottom_app_bar_widget.dart';
//import 'package:pharmagy/screens/home_screen/widgets/floating_action_button_widget.dart';

class CalendarScreenWidget extends StatelessWidget {
  const CalendarScreenWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: const Column(),
      // floatingActionButton: const FloatingActionButtonWidget(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBarWidget(
          index: 1,
      ),
    );
  }
}
