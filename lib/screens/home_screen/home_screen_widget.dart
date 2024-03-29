import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmagy/data/services/appointment_service.dart';
import 'package:pharmagy/screens/home_screen/widgets/avatar_widget/badge_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/bottom_app_bar_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/floating_action_button_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/main_item_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/bloc/shedule_appointment_bloc.dart';
import 'package:pharmagy/screens/home_screen/widgets/search_widget/search_widget.dart';
import 'package:pharmagy/constants/constants.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/schedule_appointment_widget.dart';
import 'bloc/home_screen_bloc.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  HomeScreenWidgetState createState() => HomeScreenWidgetState();
}

class HomeScreenWidgetState extends State<HomeScreenWidget> {
  final TextEditingController _controller = TextEditingController();

  String dropdownValue = 'Today';
  final item = ['Today', 'Some1','Some2','Some3'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // фиксированное положение плавающей кнопки действия floating action button fixed : resizeToAvoidBottomInset: false,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => HomeScreenBloc(
          RepositoryProvider.of<AppointmentService>(context),
        )..add(RegisterServicesEvent()),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: height / 3.2,
                  decoration: const BoxDecoration(
                    gradient: AppColor.kMainColor,
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
                            BlocBuilder<SheduleAppointmentBloc,
                                SheduleAppointmentState>(
                              builder: (context, state) {
                                if (state is SheduleListCardState) {
                                  return BadgeWidget(
                                    countBadges: state.allItemsCard.length,
                                  );
                                }
                                return const SizedBox();
                              },
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
                                BlocBuilder<SheduleAppointmentBloc,
                                    SheduleAppointmentState>(
                                  builder: (context, state) {
                                    if (state is SheduleListCardState) {
                                      return Text(
                                        '${state.allItemsCard.length} total',
                                        style: kCardsWidgetSecondTextStyle
                                            .copyWith(fontSize: 12.0),
                                      );
                                    }
                                    return Container();
                                  },
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
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
                                  items: item.map<DropdownMenuItem<String>>(
                                      (String value) {
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
                //Спросить правильно ли такой подход когда запускается BlocListener
                BlocListener<HomeScreenBloc, HomeScreenState>(
                  listener: (context, state) {
                    if (state is HomeInitial) {
                      BlocProvider.of<SheduleAppointmentBloc>(context)
                          .add(SheduleListCardEvent());
                    }
                  },
                  child: ScheduleAppointmentWidget(),
                ),
              ],
            ),
            Positioned(
                top: height / 4.2,
                child: MainItemWidget(
                  items: const ['1', '2', '3', '4'],
                )),
          ],
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButtonWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: const BottomAppBarWidget(
        index: 0,
      ),
    );
  }
}
