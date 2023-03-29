import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  String firstTIme="";
  String secondTime="";
  int numb=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        SizedBox(height: 4.h,),
        ElevatedButton(onPressed: () {

          firstTIme = DateFormat("HH:mm:ss").format(DateTime.now());
          print("=======================> $firstTIme");

        }, child: const Text("add first")),
        ElevatedButton(onPressed: () {

          secondTime = DateFormat("HH:mm:ss").format(DateTime.now());
          print("=======================> $secondTime");

        }, child: const Text("add second")),

        ElevatedButton(onPressed: () {
          DateTime startDate = DateFormat("HH:mm:ss").parse("12:00:00");

          DateTime endDate = DateFormat("HH:mm:ss").parse("13:00:00");
          Duration dif = endDate.difference(startDate).abs();


          print("=======================> ${dif.inMinutes.abs()}");

          for(int i=0;i<=dif.inMinutes.abs();i++)
            {
              if(i<30)
                {
                  numb++;
                }
              else
                {
                  numb = numb + 2;
                }
            }

          print("======= numb =========> $numb");

        }, child: const Text("for Diff"))
      ]),
    );
  }
}
