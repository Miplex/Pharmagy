import 'package:flutter/material.dart';
import '../../../constants/constants.dart';


class AvatarWidget extends StatelessWidget {
  const AvatarWidget({ required this.countAvatar, Key? key,}) : super(key: key);

 final int countAvatar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
         const DecoratedBox(
           decoration: BoxDecoration(
             boxShadow: [
               BoxShadow(
                   color: Color(0xFF0F4592),
                   blurRadius: 10.0,
                   offset: Offset(0.0, 5.0)
               ),
             ],
           ),
           child: CircleAvatar(
             radius: 24,
             backgroundColor: Colors.white,
             child:  CircleAvatar(
               radius: 22,
               backgroundColor: Color.fromRGBO(83, 33, 198, 0.2),
             ),
           ),
         ),

        Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: kAvatarOvalColor,
              child: Text('$countAvatar',
                style: kCardsWidgetSecondTextStyle.copyWith(fontSize: 9),
              ),
              ),
            ),

    ]
    );
  }
}