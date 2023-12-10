import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomAppBarWidget extends StatefulWidget {
final int index;


  const BottomAppBarWidget(
      {required this.index, Key? key})
      : super(key: key);

  @override
  BottomAppBarWidgetState createState() => BottomAppBarWidgetState();
}

class BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildBarItem(
                index: 0,
                icon: SvgPicture.asset('assets/images/icons/Home_icon.svg',
                    width: 22.0, height: 24.0, colorFilter: ColorFilter.mode(widget.index == 0 ? Colors.blue : Colors.grey, BlendMode.srcIn)),
              ),
              buildBarItem(
                index: 1,
                icon: SvgPicture.asset('assets/images/icons/Calendar_grey.svg',
                    width: 22.0, height: 24.0, colorFilter: ColorFilter.mode(widget.index == 1 ? Colors.blue : Colors.grey, BlendMode.srcIn)),
              ),
              const SizedBox(
                width: 55,
              ),
              buildBarItem(
                index: 2,
                icon: SvgPicture.asset('assets/images/icons/Clock.svg',
                    width: 22.0, height: 24.0, colorFilter: ColorFilter.mode(widget.index == 2 ? Colors.blue : Colors.grey, BlendMode.srcIn)),
              ),
              buildBarItem(
                index: 3,
                icon: SvgPicture.asset('assets/images/icons/Profile.svg',
                    width: 22.0, height: 24.0, colorFilter: ColorFilter.mode(widget.index == 3 ? Colors.blue : Colors.grey, BlendMode.srcIn)),
              ),
            ],
          ),
        ));
  }

  Widget buildBarItem({
    required int index,
    required Widget icon,
  }) {
    return IconButton(
      onPressed: (){
           //print(index);
         if (index == 1){
       
          Navigator.pushNamed(context, '/calendar');
        }else if(index == 2){
          Navigator.pushNamed(context, '/clock');
        }else if(index == 3){
          Navigator.pushNamed(context, '/profile');
        }
      },
      icon: icon,
    );
  }
}
