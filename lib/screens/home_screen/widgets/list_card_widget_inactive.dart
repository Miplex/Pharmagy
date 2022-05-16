import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListCardWidgetInactive extends StatelessWidget {
  const ListCardWidgetInactive({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 70.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: const Color(0xFFf8fbff),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0),
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/icons/anesthesia_inactive.svg',
                    width: 30,
                    height: 30,
                  )),
              // Icon(Icons.circle, color: Color.fromRGBO(212, 230, 255, 100),size: 30,),
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                const Text(
                  'Francisco Elliott',
                  style: TextStyle(
                      color: Color(0xffb0bed4),
                      fontSize: 10,
                      fontFamily:
                      'NeutrifProMedium',
                      height: 1.41),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 2),
                      child: Icon(
                        Icons.circle,
                        color: Color(0xffb0bed4),
                        size: 10.89,
                      ),
                    ),
                    Text(
                      '8:30 AM - 09:00 AM',
                      style: TextStyle(
                          color: Color(0xffb0bed4),
                          fontSize: 10,
                          height: 1.7),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
