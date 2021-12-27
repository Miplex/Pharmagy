import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmagy/constants.dart';
import 'package:pharmagy/widgets/schedule_appointment_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final TextEditingController _controller = TextEditingController();
  String dropdownValue = 'Today';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // фиксированное положение плавающей кнопки действия floating action button fixed : resizeToAvoidBottomInset: false,
      resizeToAvoidBottomInset: false,
     body: Stack(
       children: [
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               height: 260,
               decoration: const BoxDecoration(
                 gradient: Constants.mColor,
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:  [
                       SearchWidget(controller: _controller),
                       const AvatarWidget(),

                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 46),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: const [
                           Text('My Patients',style: TextStyle(color: Colors.white,fontFamily: 'NeutrifProMedium',fontSize: 18),),
                           Text('12 total',style: TextStyle(color: Colors.white,fontFamily: 'NeutrifPro',fontSize: 12),),
                         ],),
                         Container(
                          height: 38,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5),
                             color: Constants.searchColor,
                             border: Border.all(
                               color: Colors.transparent,
                             ),
                           ),
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                             child: DropdownButton<String>(
                               borderRadius: BorderRadius.circular(3.0),
                               alignment: Alignment.centerRight,
                               value: dropdownValue,
                                 icon: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white54,),
                                 style: const TextStyle(color: Colors.white, fontFamily: 'NeutrifProMedium', fontSize: 12),
                                  dropdownColor: Constants.searchColor,
                                  underline:  Container(
                                    color: Colors.transparent,
                                  ),
                                 onChanged: (String? newValue){
                                 setState(() {
                                   dropdownValue = newValue!;
                                 });
                                 },
                                 items: <String>['Today', 'Some']
                                 .map<DropdownMenuItem<String>>((String value){
                                 return DropdownMenuItem<String>(
                                   value: value,
                                   child: Text(value),
                                 );
                                 }).toList(),
                                 ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
            ScheduleAppointmentWidget(),
           ],
         ),
         Positioned(
           top: 215.0,
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 2.0),
               child: MainItemWidget(),
             )),

       ],
     ),
     floatingActionButton: const FloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}



class MainItemWidget extends StatelessWidget{
   MainItemWidget({Key? key}) : super (key: key);
  final List<String> items = <String> ['1', '2','3','4'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 408,
       height: 124,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
          itemBuilder: (BuildContext context, int index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(
                   width: 240,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    color: Constants.cardColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                          RichText(
                            text:   TextSpan(
                              children: <TextSpan>[
                                const TextSpan(text: 'Office No. 248 ',style: TextStyle(color: Colors.white,fontSize: 14,)),
                                TextSpan(text: '/ ${index + 1} patients',style: const TextStyle(color: Colors.white54)),
                              ],
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.symmetric(vertical: 5),
                             child: Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: const[
                                 Padding(
                                   padding: EdgeInsets.symmetric(horizontal: 3),
                                   child: Icon(Icons.circle, color: Color(0xffc2ddff),size: 13.86,),
                                 ),
                                 Text('8:30 AM - 02:00 PM',style: TextStyle(color: Color(0xffc2ddff),fontSize: 12),),
                               ],
                             ),
                           ),

                              Row(
                                children:  const [
                                  CircleAvatar(radius: 11.5, backgroundColor: Color(0xff7DA8DD),),
                                  SizedBox(width: 6.0,),
                                  CircleAvatar(radius: 11.5, backgroundColor: Color(0xff7DA8DD)),
                                  SizedBox(width: 6.0,),
                                  CircleAvatar(radius: 11.5, backgroundColor: Color(0xff7DA8DD)),
                                  Spacer(),
                                  _CheckerButton(),
                                ],
                              ),
                          ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            );
          }
      ),
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
        icon: const Icon(Icons.check_circle),color: const Color(0xff5298FF),iconSize: 30,);
  }
}


class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25.0),
      child: CircleAvatar(
        radius: 22.5,
        backgroundColor: Colors.white,
        child:  CircleAvatar(
          radius: 20.5,
          backgroundColor: Color.fromRGBO(83, 33, 198, 0.2),
      ),
    ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required TextEditingController controller,
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
          color: const Color(0xff3D8BFF).withAlpha(50),),],
         ),
      child: TextField(
        controller: _controller,
        textAlignVertical: TextAlignVertical.center,
        decoration:  InputDecoration(
            suffixIcon:  IconButton(
              splashColor: Colors.transparent,
              onPressed: (){},
              icon: SvgPicture.asset(
                  'assets/images/icons/Search_icon.svg',
                width: 22,height: 22),
            ),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.transparent,

            ),
          ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Colors.transparent,

              ),
            ),
            hintText: 'Search',
          hintStyle: const TextStyle(color: Color(0xffC2DDFF),fontSize: 15,fontFamily: 'NeutrifPro'),
          contentPadding: const EdgeInsets.only(left: 25.0)
        ),
        style: const TextStyle(color: Colors.white),

      ),
    );
  }
}

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add,size: 25,),
        backgroundColor: const Color(0xff3c94ff),
      ),
    );
  }
}

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/images/icons/Home_icon.svg',width: 20,height: 20,)),
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/images/icons/Calendar_icon.svg',width: 20,height: 20,)),
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/images/icons/Clock.svg',width: 20,height: 20,)),
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/images/icons/Profile.svg',width: 20,height: 20,)),

        ],
      ),
    );
  }
}
