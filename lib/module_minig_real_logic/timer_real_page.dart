import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';
import 'package:stop_watch_like_app/module_minig_real_logic/model/real_model.dart';
import 'package:stop_watch_like_app/module_minig_real_logic/controller/timer_real_controller.dart';
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
    // final TimerController timerController1 = Get.put(TimerController());

    var data = Get.arguments;
    if(data!=null)
      {
        timerController.backPageKey.value=data;
      }

    log("======== pass arguments ==========>${timerController.backPageKey.value}");

    firstCall();
    setState(() {

    });
  }

  Future firstCall() async {
    await runTimeGet();
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
  Future<void> dispose() async {

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
    timerController.valueC.value="";
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

                    if(timerController.dataS.value <= 0.0)
                    {
                      if (timerController.buttonEnabled.value == true) {

                        timerController.speed.value="1";
                        String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                        timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.data.value.toString(), isStart: false, speed: "1"));
                        timerController.storeInSharePrFunction();

                        timerController.buttonEnabled.value = false;
                        await timerController.startF().whenComplete(() {
                          timerController.buttonEnabled.value = true;
                        });
                      }
                    }
                    else
                    {
                      if (timerController.buttonEnabled3.value == true) {

                        timerController.speed.value="1";
                        String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                        timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.dataS.value.toString(), isStart: false, speed: "1"));
                        timerController.storeInSharePrFunction();

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

                    if (timerController.buttonEnabled1.value == true) {
                      timerController.speed.value="1.1";
                      String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                      timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.dataS.value.toString(), isStart: false, speed: "1.1"));
                      timerController.storeInSharePrFunction();
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

                    if (timerController.buttonEnabled2.value == true) {
                      timerController.speed.value="1.2";
                      String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                      timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.dataS.value.toString(), isStart: false, speed: "1.2"));
                      timerController.storeInSharePrFunction();
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
                    timerController.stop.value = true;

                    String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                    timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.checkDoubleOrNot.value == true ? timerController.dataS.value.toString():timerController.data.value.toString(), isStart: false, speed: timerController.speed.value));
                    timerController.storeInSharePrFunction();

                  },
                ),
                SizedBox(height: 10.h),
                CustomElevatedButton(
                  text: "Stop",
                  onPressed: () async {
                    timerController.stop.value = true;

                    String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
                    timerController.timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: timerController.checkDoubleOrNot.value == true ? timerController.dataS.value.toString():timerController.data.value.toString(), isStart: timerController.stop.value, speed: timerController.speed.value));
                    timerController.storeInSharePrFunction();

                    await timerController.storeInSharePrFunction();
                  },
                ),
                Text("${timerController.timerModelList.length}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
