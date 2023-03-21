import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  RxDouble dataS = 0.0.obs;
  RxInt data = 0.obs;

  RxBool start = false.obs;
  RxBool tenX = false.obs;
  RxBool twentyX = false.obs;
  RxBool buttonEnabled = true.obs;
  RxBool buttonEnabled1 = true.obs;
  RxBool buttonEnabled2 = true.obs;

  //
  // RxInt tenXValue = 1100.obs;
  // RxInt twentyXValue = 1100.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dataS.value=0.0;
    data.value=0;
  }

  // Future increment() async {
  //    if (start.value) {
  //     await Future.delayed( Duration(seconds: 1)).then(
  //       (value) async {
  //         dataS.value++;
  //         if (dataS.value >= 0 ) {
  //           print("=======> data  ${dataS.value.toString()}");
  //           return dataS.value + await increment(); //function call itself.
  //         }
  //       },
  //     );
  //   } else if (tenX.value) {
  //     print("=======> Future called");
  //     await Future.delayed(const Duration(milliseconds: 1100)).then(
  //           (value) async {
  //         dataS.value++;
  //         if (dataS.value >= 0 ) {
  //           print("=======> data  ${dataS.value.toString()}");
  //           return dataS.value + await increment(); //function call itself.
  //         }
  //       },
  //     );
  //   } else if (twentyX.value) {
  //     await Future.delayed(const Duration(milliseconds: 1200)).then(
  //           (value) async {
  //         dataS.value++;
  //         if (dataS.value >= 0 ) {
  //           print("=======> data  ${dataS.value.toString()}");
  //           return dataS.value + await increment(); //function call itself.
  //         }
  //       },
  //     );
  //   }
  // }


Future startF()async
{

  if(start.value==true)
  {
    await Future.delayed(const Duration(seconds: 1),);
    data.value++;
    if (data.value >= 0 ) {
      print("=======> data1  ${data.value.toString()}");
      print(" datas==============> ${dataS.value}");
      dataS.value=data.value.toDouble();
      return data.value + await startF(); //function call itself.
    }
  }

}

Future tenXF()async
{

  if(tenX.value==true) {
      await Future.delayed(const Duration(seconds: 1),);
      dataS.value=dataS.value+1.1;
      if (dataS.value >= 0.0 ) {

        print("=======> data2  ${dataS.value.toString()}");
        data.value=dataS.value.toInt();

        return dataS.value + await tenXF(); //function call itself.
      }
    }
  }

  Future twentyXF()async
  {

    if(twentyX.value==true) {
      await Future.delayed(const Duration(seconds: 1),);
      dataS.value=dataS.value+1.2;
      if (dataS.value >= 0.0 ) {

        print("=======> data3  ${dataS.value.toString()}");
        data.value=dataS.value.toInt();

        return dataS.value + await twentyXF(); //function call itself.
      }
    }
  }
}
