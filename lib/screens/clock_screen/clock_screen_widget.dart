import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pharmagy/constants/constants.dart';
import 'package:pharmagy/screens/clock_screen/paint_clock_widget.dart';

import 'cubit/clock_screen_cubit.dart';

class ClockScreenWidget extends StatelessWidget {
  const ClockScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<ClockScreenCubit>(context).changeTime();
    return Container(
      decoration: const BoxDecoration(
        gradient: kClockBackgroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(height: 65.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/images/icons/clock/Arrow.svg'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Today',
                  style: kCardsWidgetPrimaryTextStyle.copyWith(fontSize: 18.0),
                ),
                Row(
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        //Test
                       // BlocProvider.of<ClockScreenCubit>(context).changeTime();
                      },
                      icon: SvgPicture.asset(
                          'assets/images/icons/Search_icon.svg',
                          width: 15),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/images/icons/clock/Menu.svg'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 35.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 45.0),
                    Text('Office No. 248 ',
                        style: kCardsWidgetSecondTextStyle.copyWith(
                            fontSize: 18.0)),
                    Text('3 patients',
                        style: kCardsWidgetSecondTextStyle.copyWith(
                            color: Colors.white54, fontSize: 12.0)),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            FittedBox(
              child: SizedBox(
                height: 274.0,
                width: 274.0,
                child: CustomPaint(
                  painter: PaintClockWidget(),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<ClockScreenCubit, ClockScreenState>(
                            builder: (context, state) {
                              if (state is ClockUpdateState) {
                                 print('ClockUpdateState');
                                 print(state);
                                return SizedBox(
                                  height: 38,
                                  width: 140,
                                  child: Text(
                                    state.time,
                                    style: kCardsWidgetPrimaryTextStyle.copyWith(
                                        fontSize: 35),
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                          Text(
                            '', // timeFormat,
                            style: kCardsWidgetSecondTextStyle.copyWith(
                                fontSize: 20.0),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Container(
                color: Colors.white,
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
