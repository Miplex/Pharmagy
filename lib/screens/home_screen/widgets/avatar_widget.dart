import 'package:flutter/material.dart';
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 18.0),
      child: DecoratedBox(
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
          radius: 17,
          backgroundColor: Colors.white,
          child:  CircleAvatar(
            radius: 15,
            backgroundColor: Color.fromRGBO(83, 33, 198, 0.2),
          ),
        ),
      ),
    );
  }
}