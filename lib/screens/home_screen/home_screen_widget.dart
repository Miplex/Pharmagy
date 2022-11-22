import 'package:flutter/material.dart';
import 'package:pharmagy/data/services/appointment_data_service.dart';
import 'package:pharmagy/locator.dart';
import 'package:pharmagy/screens/home_screen/widgets/avatar_widget/badge_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/bottom_app_bar_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/floating_action_button_widget.dart';
//import 'package:pharmagy/screens/home_screen/widgets/list_card/list_card_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/main_item_widget.dart';
//import 'package:pharmagy/screens/home_screen/widgets/schedule_time_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/search_widget/search_widget.dart';
import 'package:pharmagy/constants/constants.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/schedule_appointment_widget.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  int index = 0;
  final TextEditingController _controller = TextEditingController();
  String dropdownValue = 'Today';
  final item = ['Today', 'Some'];
  void onChangedColorIcon(int index) {
    setState(() {
      this.index = index;
      //print('index: $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      // фиксированное положение плавающей кнопки действия floating action button fixed : resizeToAvoidBottomInset: false,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: _height / 3.2,
                decoration: const BoxDecoration(
                  gradient: kMainColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SearchWidget(controller: _controller),
                          const BadgeWidget(
                            count: 5,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My Patients',
                                style: kCardsWidgetPrimaryTextStyle.copyWith(
                                    fontSize: 18.0),
                              ),
                              Text(
                                '12 total',
                                style: kCardsWidgetSecondTextStyle.copyWith(
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 32.0,
                            width: 74.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: kSearchColor,
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(3.0),
                                alignment: Alignment.centerRight,
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Colors.white54,
                                  size: 15.0,
                                ),
                                style: kCardsWidgetPrimaryTextStyle,
                                dropdownColor: kSearchColor,
                                underline: Container(
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });                            
                                },
                                items: <String>[
                                  'Today',
                                  'Some'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 42.0,
              ),
              ScheduleAppointmentWidget(),
            ],
          ),
          Positioned(
              top: _height / 4.2,//210.0,
              child: MainItemWidget(
                items: const ['1', '2', '3', '4'],
              )),
        ],
      ),
      floatingActionButton: const FloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBarWidget(
        index: index,
        onChangedColorIcon: onChangedColorIcon,
      ),
    );
  }
}
