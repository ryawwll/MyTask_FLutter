import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appdropdown extends StatefulWidget {
  const Appdropdown({super.key});

  @override
  State<Appdropdown> createState() => _AppdropdownState();
}

class _AppdropdownState extends State<Appdropdown> {
  String? selectedProfession;
  List<String> professions = ['Teacher', 'Student'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Color(0xffD4D4D4),
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton(
        value: selectedProfession,
        hint: Text('Select Profession', style: TextStyle(color: Colors.black)),
        isExpanded: true,
        underline: SizedBox(),

        items:
            professions.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedProfession = newValue;
          });
        },
      ),
    );
  }
}
