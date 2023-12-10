import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmagy/constants/constants.dart';
import 'package:pharmagy/screens/clock_screen/cubit/clock_screen_cubit.dart';
import 'package:pharmagy/screens/clock_screen/paint_clock_widget.dart';

class Clock extends StatelessWidget {
  const Clock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   //  double width = MediaQuery.of(context).size.width;
    return FittedBox(
      child: Stack(
        children:[
           SizedBox(
          height: 274.0,
          width: 274.0,
          child: BlocBuilder<ClockScreenCubit, ClockScreenState>(
            builder: (context, state) {
              if (state is ClockUpdateState) {
                return CustomPaint(
                  painter: PaintClockWidget(),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<ClockScreenCubit, ClockScreenState>(
                            builder: (context, state) {
                              if (state is ClockUpdateState) {
                                return CircleAvatar(
                                  radius: 90,
                                  backgroundColor: const Color(0xff134c9d),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          state.time,
                                          style: kCardsWidgetPrimaryTextStyle
                                              .copyWith(fontSize: 35),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          state.timePMformat.toLowerCase(),
                                          style:
                                              kCardsWidgetPrimaryTextStyle.copyWith(
                                            color: Colors.white54,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ]),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),

      

        ]
      ),
    );
  }
}
