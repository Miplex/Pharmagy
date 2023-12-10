import 'package:flutter/material.dart';
import 'package:pharmagy/constants/constants.dart';

class ClockCardItem extends StatelessWidget{
  const ClockCardItem({Key? key, required this.items, this.pageController}) : super (key: key);
  final List<String> items;
  final PageController? pageController;// = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: media.size.width,
          height: 240,
          child: PageView.builder(
              controller: pageController,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index){
                return   SizedBox(
                  width: media.size.width,
                  height: media.size.height / 2,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ClockCard(),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}

class ClockCard extends StatelessWidget {
   const ClockCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
          ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Row(
                children: [
                  Row(children: [
                  const Icon(Icons.circle, color:  Color.fromARGB(255, 59, 140, 240),size: 15.0,),
                  const SizedBox(width: 5.0,),
                  Text('8:30 AM - 02:00 PM', style: kCardsWidgetSecondTextStyle.copyWith(color: const Color(0xff1e4070), fontSize: 10.0),),
                  ],),
                   SizedBox(width: media.size.width / 5),
                 Container(
                  width: 69,
                  height: 21,
                  color: const Color(0xffe0f5ec),
                    child: const Center(child: Text('Confirmed', style: TextStyle(color: Color(0xff76c49c), fontSize: 10.0, fontFamily: 'NeutrifPro'),)),
                    )
                ],
              ),
              const Text('Teeth Drilling', textAlign: TextAlign.start, style: TextStyle(fontFamily: 'NeutrifPro', fontSize: 16),),
               Padding(
                 padding: const EdgeInsets.only(right: 8.0),
                 child: Text('The dentist has to drill a Arthur’s tooth cavity because the cavity (the hole in the tooth) is not just an empty space - it is actually filled with decayed tooth material.',
                                      maxLines: 3, overflow: TextOverflow.fade, style: kCardsWidgetSecondTextStyle.copyWith(height: 2.0, color: const Color(0xff8193ae)),),
               ),
              Row(
                children: [
                  const Icon(Icons.circle, color:  Color(0xffe8e8e8),size: 30.0,),
                  const SizedBox(width: 10.0,),
                  Text('Arthur Clayton', style: kCardsWidgetSecondTextStyle.copyWith(color: const Color(0xff404d66)),),
                  ],),
            ],
          ),
        ),
      );
  }
}
