import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';
import 'package:stop_watch_like_app/module_minig_real_logic/model/real_model.dart';
import 'package:stop_watch_like_app/module_minig_real_logic/timer_real_controller.dart';
import 'package:stop_watch_like_app/widget/custom_elevatedbutton.dart';

class RealTimerPage extends StatefulWidget {
   RealTimerPage({Key? key}) : super(key: key);

  @override
  State<RealTimerPage> createState() => _RealTimerPageState();
}

class _RealTimerPageState extends State<RealTimerPage> {
  RealTimerController timerController=RealTimerController();

   SharePreference sharePreference=SharePreference();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    runTimeGet();
  }

  runTimeGet()
  async {
    await timerController.getInSharePrFunction();
  }

  boolToIntToBool()
  {
    timerController.checkDoubleOrNot.value == false
        ? timerController.dataS.value =
        timerController.data.value.toDouble()
        : timerController.data.value =
        timerController.dataS.value.toInt();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Obx(()=>
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                // Text("${timerController.data.value}",style: TextStyle(fontSize: 25)),
                // SizedBox(height: 6.h),
                // CustomElevatedButton(
                //   onPressed: () async {
                //     timerController.start.value = true;
                //
                //     String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                //     timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.data.value.toString(), isStart: true, speed: "1"));
                //
                //     print("====================>   ${timerController.timerModelList[0]}");
                //     if(timerController.dataS.value <= 0.0)
                //     {
                //       if (timerController.buttonEnabled.value == true) {
                //         timerController.buttonEnabled.value = false;
                //         await timerController.startF().whenComplete(() {
                //           timerController.buttonEnabled.value = true;
                //         });
                //       }
                //     }
                //   },
                //   text: "Start",
                // ),

                Text(
                    "${timerController.checkDoubleOrNot.value ? timerController.dataS.value.toStringAsFixed(1) : timerController.data.value}",
                    style: const TextStyle(fontSize: 40,color: Colors.black)),
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

                      String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                      timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.data.value.toString(), isStart: true, speed: "1"));
                      timerController.storeInSharePrFunction();
                      if (timerController.buttonEnabled.value == true) {
                        timerController.buttonEnabled.value = false;
                        await timerController.startF().whenComplete(() {
                          timerController.buttonEnabled.value = true;
                        });
                      }
                    }
                    else
                    {

                      String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                      timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.dataS.value.toString(), isStart: true, speed: "1"));
                      timerController.storeInSharePrFunction();
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
                    String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                    timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.dataS.value.toString(), isStart: true, speed: "1.1"));
                    timerController.storeInSharePrFunction();

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
                    String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                    timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.dataS.value.toString(), isStart: true, speed: "1.2"));
                    timerController.storeInSharePrFunction();

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


                // ElevatedButton(onPressed: () {
                //   String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                //   timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.data.value.toString(), isStart: true, speed: "1"));
                //
                // }, child: const Text("for add")),
                //
                // ElevatedButton(onPressed: () async {
                //   await timerController.storeInSharePrFunction();
                //
                // }, child: Text("for store")),
                //
                // ElevatedButton(onPressed: () async {
                //   await timerController.getInSharePrFunction();
                //
                // }, child: Text("for get")),
                Text("${timerController.timerModelList.length}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
