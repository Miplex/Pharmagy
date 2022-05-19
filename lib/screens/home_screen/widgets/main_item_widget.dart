import 'package:flutter/material.dart';
import 'package:pharmagy/constants/constants.dart';

class MainItemWidget extends StatelessWidget{
  MainItemWidget({Key? key}) : super (key: key);
  final List<String> items = <String> ['1', '2','3' ,'1', '2','3'];
  final PageController _pageController = PageController(viewportFraction: 0.6);

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Column(
      children: [
        SizedBox(
          width: media.size.width,
          height: media.size.height / 6.0,
          child: PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children:  [
                    SizedBox(
                     // width: media.size.width / 1.5,
                      width: 242,
                      height: 104,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        color: kCardColor,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient:  const LinearGradient(
                                stops: [0.03,0.03],
                                colors: [Color(0xff66AAFF), kCardColor]
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFE5EAF5),
                                spreadRadius: 1.0,
                                blurRadius: 2.0,
                                offset: Offset(0.0, 3.0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0, top: 8.0),
                                    child: RichText(
                                      text:   TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: 'Office No. 248 ',style: kCardsWidgetSecondTextStyle.copyWith(fontSize: 11.0)),
                                          TextSpan(text: '/ 3 patients',style: kCardsWidgetSecondTextStyle.copyWith(color: Colors.white54,fontSize: 11.0)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.circle, color:  Color(0xffc2ddff),size: 9.0,),
                                        const SizedBox(width: 2.0,),
                                        Text('8:30 AM - 02:00 PM', style: kCardsWidgetSecondTextStyle.copyWith(color: Colors.white54, fontSize: 10.0),),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                                    child: SizedBox(
                                      height: 52.0,
                                      child: Row(
                                        children:  const [
                                          CircleAvatar(radius: 8.0, backgroundColor: Color(0xff7DA8DD),),
                                          SizedBox(width: 6.0,),
                                          CircleAvatar(radius: 8.0, backgroundColor: Color(0xff7DA8DD)),
                                          SizedBox(width: 6.0,),
                                          CircleAvatar(radius: 8.0, backgroundColor: Color(0xff7DA8DD)),
                                          Spacer(),
                                          _CheckerButton(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
          ),
        ),
      ],
    );
  }
}

class _CheckerButton extends StatelessWidget {
  const _CheckerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: (){},
      icon: const Icon(Icons.check_circle),color: const Color(0xff5298FF),iconSize: 20.0,);
  }
}
