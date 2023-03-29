import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_like_app/module_minig_real_logic/all_pair_Page.dart';

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
            home:AllPairPageSec(),
            // home: AllPairPage(),
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
// class AppBindings extends Bindings {
//   @override
//   void dependencies() {
//     // Get.lazyPut<TimerController>(() => TimerController());
//     Get.put<TimerController>(TimerController());
//   }
// }