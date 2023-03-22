import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';
import 'package:stop_watch_like_app/modules/timer_controller.dart';
import 'package:stop_watch_like_app/widget/custom_elevatedbutton.dart';

class TimerPage extends StatelessWidget {
  TimerPage({Key? key}) : super(key: key);

  TimerController timerController = Get.put(TimerController());
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

                  if (timerController.buttonEnabled.value == true) {
                    timerController.buttonEnabled.value = false;
                     timerController.dataS.value <= 0.0
                        ? await timerController.startF().whenComplete(() {
                            timerController.buttonEnabled.value = true;
                          })
                        : await timerController.startSec().whenComplete(() {
                            timerController.buttonEnabled.value = true;
                          });
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
                onPressed: () {
                  timerController.start.value = false;
                  timerController.twentyX.value = false;
                  timerController.tenX.value = false;

                  Future.delayed(const Duration(seconds: 1)).then((value) {
                    timerController.dataS.value = 0.0;
                    timerController.data.value = 0;
                  });
                },
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                text: "Stop",
                onPressed: () async {
                  timerController.stop.value = true;
                  Future.delayed(const Duration(seconds: 1));

                  if (timerController.data.value >=
                      timerController.dataS.value) {
                    timerController.storeData.value =
                        timerController.data.value.toString();
                  } else {
                    timerController.storeData.value =
                        timerController.dataS.value.toString();
                  }

                  await sharePreference.addStringToSF("storeData1", timerController.storeData.value);

                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
