import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_like_app/modules/time_converter.dart';
import 'package:stop_watch_like_app/modules/timer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            // initialBinding: AppBindings(),
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:TimerPage(),
            // home: Time_of_day(),
          );
        }
    );
  }
}
// class AppBindings extends Bindings
// {
//
//   @override
//   void dependencies() {
//      Get.lazyPut(() => (TimerController()));
//   }
// }