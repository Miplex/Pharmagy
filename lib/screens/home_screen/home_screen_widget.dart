import 'package:flutter/material.dart';
import 'package:pharmagy/components/avatar_widget.dart';
import 'package:pharmagy/components/bottom_app_bar_widget.dart';
import 'package:pharmagy/components/floating_action_button_widget.dart';
import 'package:pharmagy/components/main_item_widget.dart';
import 'package:pharmagy/components/popup_dialog_widget.dart';
import 'package:pharmagy/components/search_widget.dart';
import 'package:pharmagy/constants.dart';
import 'package:pharmagy/widgets/schedule_appointment_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
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
    return Scaffold(
      // фиксированное положение плавающей кнопки действия floating action button fixed : resizeToAvoidBottomInset: false,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 190,
                decoration: const BoxDecoration(
                  gradient: kMainColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchWidget(controller: _controller),
                        const AvatarWidget(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'My Patients',
                                style: kCardsWidgetPrimaryTextStyle,
                              ),
                              Text(
                                '12 total',
                                style: kCardsWidgetSecondTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: kSearchColor,
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(3.0),
                                alignment: Alignment.centerRight,
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Colors.white54,
                                  size: 15.0,
                                ),
                                style: kCardsWidgetPrimaryTextStyle.copyWith(
                                    fontSize: 9.0),
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
              ScheduleAppointmentWidget(items: ['1',''],),
            ],
          ),
          Positioned(top: 150.0, child: MainItemWidget()),
        ],
      ),
      floatingActionButton:  FloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBarWidget(
        index: index,
        onChangedColorIcon: onChangedColorIcon,
      ),
    );
  }
}
