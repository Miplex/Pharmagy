import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmagy/constants/constants.dart';
import 'package:pharmagy/screens/clock_screen/widgets/clock_card_item.dart';
import 'package:pharmagy/screens/clock_screen/widgets/clock_widget.dart';
//import 'package:pharmagy/screens/home_screen/widgets/bottom_app_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cubit/clock_screen_cubit.dart';

class ClockScreenWidget extends StatelessWidget {
  const ClockScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    BlocProvider.of<ClockScreenCubit>(context).changeTime(true);
    double width = MediaQuery.of(context).size.width;
    final controller = PageController(viewportFraction: 0.8, keepPage: true);
    return Container(
      decoration: const BoxDecoration(
        gradient: kClockBackgroundColor,
        
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children:[
            Container(
              height: 387,
              decoration: const BoxDecoration(
              gradient: kClockColor,),
               ),
            Column(
            children: [
              const SizedBox(height: 65.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: SvgPicture.asset('assets/images/icons/clock/Arrow.svg'),
                    onPressed: () {
                      Navigator.pop(context);
                      BlocProvider.of<ClockScreenCubit>(context).changeTime(false);
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
                        onPressed: () {},
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
                height: 10.0,
              ),             
             Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(
                children: [ 
               const Clock(),
                  Positioned(
                    right: 20.0,
                    top: 20.0,
                    child: CircleAvatar(
                      radius: 22.0, 
                      child: SvgPicture.asset('assets/images/icons/anesthesia.svg',
                      width: 20.0, height: 20.0,
                      color: Colors.white,
                      ),
                    ),
                    ),
                  ]
                ),
            ),
            ],
          ),
           
            
          
          Stack(
            children: [
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: width,
                  height: 103,
                  decoration: const BoxDecoration(
                    gradient:  LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 234, 234, 234)]
                      ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: const SlideEffect(
                                    spacing: 10.0,
                                    dotWidth: 24.0,
                                    dotHeight: 1.8,
                                    paintStyle: PaintingStyle.stroke,
                                    strokeWidth: 1.8,
                                    dotColor: Color(0xffced0d6),
                                    activeDotColor: Color.fromARGB(255, 12, 14, 145),
                               ),
                      ),
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 70.0,
              child: ClockCardItem(items: const ['1', '2', '3'], pageController: controller,),
              ),
            ],
          ),
          ],
        ),
        
      ),
    );
  }
}


