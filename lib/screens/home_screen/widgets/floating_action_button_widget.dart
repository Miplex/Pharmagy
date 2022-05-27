import 'package:flutter/material.dart';
import 'package:pharmagy/constants/constants.dart';
import 'package:pharmagy/data/model/appointment_data.dart';

import 'alert/alertTimeWidget.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  _FloatingActionButtonState createState() => _FloatingActionButtonState();
}

class _FloatingActionButtonState extends State<FloatingActionButtonWidget> {
  

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final beginTimeHourController = TextEditingController();
  final beginTimeMinuteController = TextEditingController();
  final endTimeHourController = TextEditingController();
  final endTimeMinuteController = TextEditingController();

  List<AppointmentData> appointmentData = [];


  addData() {
    appointmentData = [
      AppointmentData(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        beginTimeHour: beginTimeHourController.text,
        beginTameMinute: beginTimeMinuteController.text,
        endTmeHour: endTimeHourController.text,
        endTimeMinute: endTimeMinuteController.text,
      )
    ];
  }

  // void _printlatestvalue(BuildContext context) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ListCardWidget(
  //           firstNameController: firstNameController.text,
  //           lastNameController: lastNameController.text,
  //           beginTimeHourController: int.parse(beginTimeHourController.text),
  //           beginTimeMinuteController:
  //               int.parse(beginTimeMinuteController.text),
  //           endTimeHourController: int.parse(endTimeHourController.text),
  //           endTimeMinuteController: int.parse(endTimeMinuteController.text),
  //         ),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: kAddItemColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SizedBox(
          height: 30,
          width: 30,
          child: FloatingActionButton(
            onPressed: () {
              //AlertDialog
              buildShowDialog(context);
            },
            child: const Icon(
              Icons.add,
              size: 20.0,
            ),
            backgroundColor: const Color(0xff3c94ff),
          ),
        ),
      ),
    );
  }

  Future<dynamic>buildShowDialog(BuildContext context){
   
     String dataDropDownValue = 'appointment';
     final item = ['appointment', 'anesthesia', 'mouthwash'];

        changeIcon(String value) {
    for (var element in item) {
      if (value == element) {
      print(value);
    }
    }
  }

    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState){
        return  AlertDialog(
          title:  Text('Add appointment', 
          textAlign: TextAlign.center, style: kCardsWidgetSecondTextStyle.copyWith(color: Colors.black, fontSize: 16),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                        fontSize: 12.0,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                        fontSize: 12.0,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Text('Start Time', style: kCardsWidgetSecondTextStyle.copyWith(color: Colors.black, fontSize: 14),),
                        Text('End Time', style: kCardsWidgetSecondTextStyle.copyWith(color: Colors.black, fontSize: 14),),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        AlertTimeWidget(
                          beginTimeController: beginTimeHourController,
                          hintTimeText: 'Hour',
                        ),
                       const Text(':',  style: TextStyle(fontSize: 18),),
                        AlertTimeWidget(
                          beginTimeController: beginTimeMinuteController,
                          hintTimeText: 'Minute',
                        ),
                        AlertTimeWidget(
                          beginTimeController: endTimeHourController,
                          hintTimeText: 'Hour',
                        ),
                        const Text(':', style: TextStyle(fontSize: 18),),
                        AlertTimeWidget(
                          beginTimeController: endTimeMinuteController,
                          hintTimeText: 'Minute',
                        ),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 5.0, horizontal: 5.0),
                        //   width: 60.0,
                        //   child: TextField(
                        //     controller: beginTimeMinuteController,
                        //     keyboardType: TextInputType.number,
                        //     maxLength: 2,
                        //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        //     decoration: const InputDecoration(
                        //       hintText: 'Minute',
                        //       counter: Offstage(),
                        //       hintStyle: TextStyle(
                        //         fontSize: 12.0,
                        //       ),
                        //       border: OutlineInputBorder(),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 5.0, horizontal: 5.0),
                        //   width: 60.0,
                        //   child: TextField(
                        //     controller: endTimeHourController,
                        //     keyboardType: TextInputType.number,
                        //     maxLength: 2,
                        //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        //     decoration: const InputDecoration(
                        //       hintText: 'Hour',
                        //       counter: Offstage(),
                        //       hintStyle: TextStyle(
                        //         fontSize: 12.0,
                        //       ),
                        //       border: OutlineInputBorder(),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 5.0, horizontal: 5.0),
                        //   width: 60.0,
                        //   child: TextField(
                        //     controller: endTimeMinuteController,
                        //     keyboardType: TextInputType.number,
                        //     maxLength: 2,
                        //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        //     decoration: const InputDecoration(
                        //       hintText: 'Minute',
                        //       counter: Offstage(),
                        //       hintStyle: TextStyle(
                        //         fontSize: 12.0,
                        //       ),
                        //       border: OutlineInputBorder(),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
                DropdownButton<String>(
                  items: item.map(buildMenuItem).toList(),
                  alignment: Alignment.centerRight,
                  value: dataDropDownValue,
                  onChanged: (String? value) {
                    setState(() {
                      dataDropDownValue = value!;
                      changeIcon(dataDropDownValue);
                    });
                      //changeIcon(dataDropDownValue);
                     
                      // print(dataDropDownValue);
                  
                  },
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        //Navigator.pop();
                        //Пример передачи данных
                        // _printlatestvalue(context);
                        addData();
                      },
                      child:  Text('Done', style: kCardsWidgetSecondTextStyle.copyWith(fontSize: 16, color:  Colors.blueAccent)),
                      ),
                    
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:  Text('Cancel', style: kCardsWidgetSecondTextStyle.copyWith(fontSize: 16, color: Colors.blueAccent),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
        }
        
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item, style: kCardsWidgetSecondTextStyle.copyWith(color: Colors.black, fontSize: 13),),
      );
}

