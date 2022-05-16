import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListCardWidgetCurrently extends StatelessWidget {
 const ListCardWidgetCurrently({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 100.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0),
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/icons/anesthesia_oval.svg',
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
                      color: Color(0xff404d66),
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
                        color: Color(0xff8193ae),
                        size: 10.89,
                      ),
                    ),
                    Text(
                      '8:30 AM - 09:00 AM',
                      style: TextStyle(
                          color: Color(0xff8193ae),
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
