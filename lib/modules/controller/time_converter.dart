import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class Time_of_day extends StatefulWidget {
  const Time_of_day({Key? key}) : super(key: key);

  @override
  State<Time_of_day> createState() => _Time_of_dayState();
}

class _Time_of_dayState extends State<Time_of_day> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 10.h,),
        ElevatedButton(onPressed: () {

          // Get your time in term of date time
          String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());

          print("======== addCurrent ======> ${addCurrent}");

          DateTime startDate = DateFormat("HH:mm:ss").parse("15:47:20");
          DateTime endDate = DateFormat("HH:mm:ss").parse("15:47:40");

// Get the Duration using the diferrence method
          Duration dif = endDate.difference(startDate);

// Print the result in any format you want
          print(dif.toString()); // 12:00:00.000000
              print(dif.inSeconds); // 12

        }, child: Text("data"))
      ]),
    );
  }
}
