import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';
import 'package:stop_watch_like_app/modules/timer_controller.dart';

class TimerPage extends StatelessWidget {
  TimerPage({Key? key}) : super(key: key);

  TimerController timerController = Get.put(TimerController());
  SharePreference sharePreference=SharePreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Obx(()=>
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text("${timerController.start.value ?timerController.data.value:timerController.dataS.value.toStringAsFixed(1)}",style: TextStyle(fontSize: 40)),
              SizedBox(height: 10.h),
              ElevatedButton(onPressed: () async {
                timerController.start.value=true;
                timerController.twentyX.value=false;
                timerController.tenX.value=false;

                if (timerController.buttonEnabled.value==true) {
                  timerController.buttonEnabled.value = false;
                  await timerController.startF().whenComplete(() {
                    timerController.buttonEnabled.value = true;
                  });
                }

              }, child: const Text("start",)),
              SizedBox(height: 10.h),
              ElevatedButton(onPressed: () async {
                timerController.start.value=false;
                timerController.twentyX.value=false;
                timerController.tenX.value=true;

                if (timerController.buttonEnabled1.value==true) {
                  timerController.buttonEnabled1.value = false;
                  await timerController.tenXF().whenComplete(() {
                    timerController.buttonEnabled1.value = true;
                  });
                }

              }, child: const Text("10 X")),
              ElevatedButton(onPressed: () async {
                timerController.start.value=false;
                timerController.twentyX.value=true;
                timerController.tenX.value=false;
                if (timerController.buttonEnabled2.value==true) {
                  timerController.buttonEnabled2.value = false;
                  await timerController.twentyXF().whenComplete(() {
                    timerController.buttonEnabled2.value = true;
                  });
                }

              }, child: const Text("20 X")),
              SizedBox(height: 10.h),
              ElevatedButton(onPressed: () {
                timerController.start.value=false;
                timerController.twentyX.value=false;
                timerController.tenX.value=false;

                Future.delayed( const Duration(seconds: 1)).then((value) {
                  timerController.dataS.value=0.0;
                  timerController.data.value=0;
                });

              }, child: const Text("reset")),

            ],
          ),
        ),
      )),
    );
  }
}
