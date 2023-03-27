import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';
import 'package:stop_watch_like_app/modules/timer_controller.dart';
import 'package:stop_watch_like_app/widget/custom_elevatedbutton.dart';

class TimerPage extends StatefulWidget {
  TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  final TimerController timerController = Get.put(TimerController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final TimerController timerController1 = Get.put(TimerController());

    var data = Get.arguments;
    timerController.backPageKey.value=data;

    log("======== pass arguments ==========>${timerController.backPageKey.value}");

    firstCall();
    setState(() {

    });
  }

  Future firstCall() async {
   await timerController.callInInit();
  }

  SharePreference sharePreference = SharePreference();

  String name = "";
  boolToIntToBool()
  {
    timerController.checkDoubleOrNot.value == false
        ? timerController.dataS.value =
        timerController.data.value.toDouble()
        : timerController.data.value =
        timerController.dataS.value.toInt();
  }

  @override
  Future<void> dispose() async {
    // TODO: implement dispose

    // String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
    //
    // log("current date finalTime============>${addCurrent}");
    //
    // List<String> splitList = addCurrent.split(':');
    //
    // int hour=int.parse(splitList[0]);
    // int min=int.parse(splitList[1]);
    // int sec=int.parse(splitList[2]);
    //
    //
    // timerController.storeInSharePre[0]=hour.toString();
    // timerController.storeInSharePre[1]=min.toString();
    // timerController.storeInSharePre[2]=sec.toString();
    // timerController.storeInSharePre[7]=timerController.storeData.value.toString();
    // timerController.storeInSharePre[8]=timerController.stop.value;
    //
    // timerController.storeInSharePrFunction();
    //
    // String decodeD = await sharePreference.getStringValuesSF(timerController.backPageKey.value.toString());
    // timerController.storeInSharePre.value=List.from(jsonDecode(decodeD));
    //
    // timerController.stop.value = timerController.storeInSharePre[8];
    //
    // log("=========> final result $decodeD");

    super.dispose();
    print("dispose method callll");

     timerController.backPageKey.value="";
    timerController.dataSe.value = 0.0;
    timerController.dataS.value = 0.0;
    timerController.data.value = 0;

    timerController.start.value = false;
    timerController.checkDoubleOrNot.value = false;
    timerController.tenX.value = false;
    timerController.twentyX.value = false;
    timerController.buttonEnabled.value = true;
    timerController.buttonEnabled1.value = true;
    timerController.buttonEnabled2.value = true;
    timerController.buttonEnabled3.value = true;

    timerController.currentDate.value = "";
    timerController.pastDate.value = "";

    timerController.storeData.value = "";
    timerController.finalY.value=0;
    timerController.stop.value = false;

    timerController.hour.value=0;
    timerController.min.value=0;
    timerController.sec.value=0;
    timerController.hourPast.value=0;
    timerController.minPast.value=0;
    timerController.secPast.value=0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Center(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "${timerController.checkDoubleOrNot.value ? timerController.dataS.value.toStringAsFixed(1) : timerController.data.value}",
                  style: const TextStyle(fontSize: 40,color: Colors.white)),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                onPressed: () async {
                  timerController.stop.value = false;
                  timerController.start.value = true;
                  timerController.twentyX.value = false;
                  timerController.tenX.value = false;
                  timerController.stop.value = false;

                  if(timerController.dataS.value <= 0.0)
                    {
                      if (timerController.buttonEnabled.value == true) {
                        timerController.buttonEnabled.value = false;
                        await timerController.startF().whenComplete(() {
                          timerController.buttonEnabled.value = true;
                        });
                      }
                    }
                  else
                    {
                      if (timerController.buttonEnabled3.value == true) {
                        timerController.buttonEnabled3.value = false;
                        await timerController.startSec().whenComplete(() {
                          timerController.buttonEnabled3.value = true;
                        });
                      }
                    }
                },
                text: "start",
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                text: "10 X",
                onPressed: () async {
                  timerController.stop.value = false;
                  timerController.start.value = false;
                  timerController.twentyX.value = false;
                  timerController.tenX.value = true;
                  timerController.stop.value = false;

                  if (timerController.buttonEnabled1.value == true) {
                    timerController.buttonEnabled1.value = false;
                    boolToIntToBool();
                    await timerController.tenXF().whenComplete(() {
                      timerController.buttonEnabled1.value = true;
                    });
                  }
                },
              ),
              SizedBox(height: 2.h),
              CustomElevatedButton(
                text: "20 X",
                onPressed: () async {

                  timerController.stop.value = false;
                  timerController.start.value = false;
                  timerController.twentyX.value = true;
                  timerController.tenX.value = false;
                  timerController.stop.value = false;

                  if (timerController.buttonEnabled2.value == true) {
                    timerController.buttonEnabled2.value = false;
                    boolToIntToBool();
                    await timerController.twentyXF().whenComplete(() {
                      timerController.buttonEnabled2.value = true;
                    });
                  }
                },
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                text: "reset",
                onPressed: () async {
                  timerController.start.value = false;
                  timerController.twentyX.value = false;
                  timerController.tenX.value = false;
                  timerController.stop.value = false;

                  timerController.dataS.value = 0.0;
                  timerController.data.value = 0;
                  timerController.storeInSharePre[7]=0;

                  //
                  // timerController.sharePrefWhenOpenApp();
                  // await timerController.storeInSharePrFunction();
                  timerController.stop.value = true;

                  timerController.dataS.value = 0.0;
                  timerController.data.value = 0;


                  String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());

                  log("current date finalTime============>${addCurrent}");

                  List<String> splitList = addCurrent.split(':');

                  int hour=int.parse(splitList[0]);
                  int min=int.parse(splitList[1]);
                  int sec=int.parse(splitList[2]);

                  timerController.storeInSharePre[0]=hour.toString();
                  timerController.storeInSharePre[1]=min.toString();
                  timerController.storeInSharePre[2]=sec.toString();
                  timerController.storeInSharePre[7]="0";

                  timerController.hour.value=hour;
                  timerController.min.value =min;
                  timerController.sec.value =sec;
                  timerController.sharePrefWhenOpenApp();
                  await timerController.storeInSharePrFunction();
                },
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                text: "Stop",
                onPressed: () async {
                  timerController.stop.value = true;
                  timerController.storeInSharePre[8]=true;

                  await timerController.storeInSharePrFunction();

                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
