import 'package:flutter/material.dart';
import 'package:pharmagy/components/list_card_widget.dart';
import '../constants.dart';
import '../model/appointment_data.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  _FloatingActionButtonState createState() => _FloatingActionButtonState();
}
  class _FloatingActionButtonState extends State<FloatingActionButtonWidget> {

    String dataDropDownValue = 'appointment';
    final item = ['appointment', 'anesthesia', 'mouthwash'];
    TimeOfDay selectedTime = TimeOfDay.now();

    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final beginTimeHourController = TextEditingController();
    final beginTimeMinuteController = TextEditingController();
    final endTimeHourController = TextEditingController();
    final endTimeMinuteController = TextEditingController();
    AppointmentData appData = AppointmentData('', '', '', '', '', '');


    void _printlatestvalue(BuildContext context){
        // appData.firstName = firstNameController.text;
        // appData.lastName = lastNameController.text;
        // print(appData.firstName);
        // print(appData.lastName);

        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ListCardWidget(
              firstNameController: firstNameController.text,
              lastNameController: lastNameController.text,
              beginTimeHourController: beginTimeHourController.text,
              beginTimeMinuteController: beginTimeMinuteController.text,
              endTimeHourController: endTimeHourController.text,
              endTimeMinuteController: endTimeMinuteController.text,
            ),
        )
        );
      // print(firstNameController.text);
      // print(lastNameController.text);
      // print(beginTimeHourController.text);
      // print(beginTimeMinuteController.text);
      // print(endTimeHourController.text);
      // print(endTimeMinuteController.text);
    }

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
                buildShowDialog(context, item);
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

    Future<dynamic> buildShowDialog(BuildContext context, List<String> item) {

      return showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(
                      title:  const Text('Add appointment'),
                      content: SingleChildScrollView(
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                              child:  TextField(
                                controller: firstNameController,
                                  decoration: const InputDecoration(
                                    hintText: 'First Name',
                                    hintStyle: TextStyle(fontSize: 12.0,),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                            ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                child:  TextField(
                                  controller: lastNameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Last Name',
                                    hintStyle: TextStyle(fontSize: 12.0,),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Row(
                                children:  [
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                    width: 60.0,
                                    child:  TextField(
                                      controller: beginTimeHourController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'Begin Time',
                                        hintText: 'Hour',
                                        hintStyle: TextStyle(fontSize: 12.0,),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                    width: 60.0,
                                    child:   TextField(
                                      controller: beginTimeMinuteController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'Begin Time',
                                        hintText: 'Minute',
                                        hintStyle: TextStyle(fontSize: 12.0,),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                    width: 60.0,
                                    child: TextField(
                                      controller: endTimeHourController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'End Time',
                                        hintText: 'Hour',
                                        hintStyle: TextStyle(fontSize: 12.0,),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                    width: 60.0,
                                    child:   TextField(
                                      controller: endTimeMinuteController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'End Time',
                                        hintText: 'Minute',
                                        hintStyle: TextStyle(fontSize: 12.0,),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DropdownButton<String>(
                                items: item.map(buildMenuItem).toList(),
                                alignment: Alignment.centerRight,
                                value:  dataDropDownValue,
                                onChanged: (String? value) {
                                  //print(value);
                                  print(dataDropDownValue);
                                  setState(() {
                                    dataDropDownValue = value!;
                                    // print(dataDropDownValue);
                                  });
                                },
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: (){
                                      //Navigator.pop();
                                      //Пример передачи данных
                                      _printlatestvalue(context);
                                    },
                                    child: const Text('Done'),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ),
              );
    }

    DropdownMenuItem<String> buildMenuItem(String item) =>
        DropdownMenuItem(
          value: item,
          child: Text(item),
        );

}
