import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';


class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
    required this.countBadges
  }) :  super(key: key);
 final int countBadges;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -6, end: 3),
           badgeAnimation: const badges.BadgeAnimation.slide(toAnimate: false),
            badgeContent:   Text( '$countBadges',
              style: const TextStyle(color: Colors.white, fontSize: 11.0),
            ),
          child:  const DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF0F4592),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 5.0)),
                  ],
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor:  Color.fromRGBO(83, 33, 198, 0.2),
                    backgroundImage: NetworkImage('https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
                  ),
                ),
              ),
          ),
    );
  }
}
