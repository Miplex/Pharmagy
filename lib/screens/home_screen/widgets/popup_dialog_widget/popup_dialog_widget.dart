import 'package:flutter/material.dart';

class PopUpDialogWidget extends StatelessWidget {
   PopUpDialogWidget({Key? key}) : super(key: key);
 String? value;
  @override
  Widget build(BuildContext context) {
    final item = ['item1', 'item2'];
    return Material(
      child: Column(
        children: [
          const TextField(),
          const TextField(),
          DropdownButton<String>(
            items: item.map(buildMenuItem).toList(),
            onChanged: (value) => this.value = value,
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem (String item) => DropdownMenuItem(
    value: item,
      child: Text(item),
  );
}
