import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomAppBarWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedColorIcon;

  const BottomAppBarWidget(
      {required this.index, required this.onChangedColorIcon, Key? key})
      : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
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
                    width: 20.0),
              ),
              buildBarItem(
                index: 1,
                icon: SvgPicture.asset('assets/images/icons/Calendar_grey.svg',
                    width: 20.0),
              ),
              const SizedBox(
                width: 55,
              ),
              buildBarItem(
                index: 2,
                icon: SvgPicture.asset('assets/images/icons/Clock.svg',
                    width: 20.0),
              ),
              buildBarItem(
                index: 3,
                icon: SvgPicture.asset('assets/images/icons/Profile.svg',
                    width: 20.0),
              ),
            ],
          ),
        ));
  }

  Widget buildBarItem({
    required int index,
    required icon,
  }) {
    final isSelected = index == widget.index;
    return IconButton(
      //onPressed: () => widget.onChangedColorIcon(index),
      onPressed: (){
         if (index == 1){
          Navigator.pushNamed(context, '/calendar');
        }else if(index == 2){
          Navigator.pushNamed(context, '/clock');
        }else if(index == 3){
          Navigator.pushNamed(context, '/profile');
        }
      },
      icon: icon,
      color: isSelected ? Colors.blue : Colors.grey,
    );
  }
}
