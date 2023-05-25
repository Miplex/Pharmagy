import 'package:flutter/material.dart';
import 'package:pharmagy/screens/home_screen/widgets/bottom_app_bar_widget.dart';
//import 'package:pharmagy/screens/home_screen/widgets/floating_action_button_widget.dart';

class CalendarScreenWidget extends StatelessWidget {
  const CalendarScreenWidget({Key? key}) : super(key: key);

  void onChangedColorIcon(int index) {
    index = index;
    //print(' CalendarScreenWidge: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Column(),
      // floatingActionButton: const FloatingActionButtonWidget(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarWidget(
        index: 0,
        onChangedColorIcon: onChangedColorIcon,
      ),
    );
  }
}
