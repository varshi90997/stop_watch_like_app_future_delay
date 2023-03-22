import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';

class TimerController extends GetxController {
  RxDouble dataSe = 0.0.obs;
  RxDouble dataS = 0.0.obs;
  RxInt data = 0.obs;

  RxBool start = false.obs;
  RxBool checkDoubleOrNot = false.obs;
  RxBool tenX = false.obs;
  RxBool twentyX = false.obs;
  RxBool buttonEnabled = true.obs;
  RxBool buttonEnabled1 = true.obs;
  RxBool buttonEnabled2 = true.obs;



  RxString storeData="".obs;
  RxBool stop = false.obs;


  //
  // RxInt tenXValue = 1100.obs;
  // RxInt twentyXValue = 1100.obs;
  SharePreference sharePreference = SharePreference();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    // dataS.value=0.0;
    // data.value=0;

    storeData.value = await sharePreference.getStringValuesSF("storeData1");
    storeData.contains(".") ?dataSe.value=double.parse(storeData.value.toString()) : data.value=int.parse(storeData.value.toString());
    String converter=dataSe.toStringAsFixed(1);
    dataS.value=double.parse(converter.toString());

    storeData.contains(".") ? checkDoubleOrNot.value=true: checkDoubleOrNot.value=false;
    print("store data=================>${storeData.value.toString()}");
    print("store dataS=================>${dataS.value.toString()}");
    print("store data=================>${data.value.toString()}");

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

  if(start.value==true&&stop.value==false&&dataS.value<=0.0)
  {
    checkDoubleOrNot.value=false;
    data.value++;
    await Future.delayed(const Duration(seconds: 1),);
    if (data.value >= 0 ) {
      print("=======> data1  ${data.value.toString()}");
      print(" datas==============> ${dataS.value}");
      // dataS.value=data.value.toDouble();
      return data.value + await startF(); //function call itself.
    }
  }
}
Future startSec()async
{
  if(start.value==true&&stop.value==false)
  {
  checkDoubleOrNot.value=true;
  dataS.value=dataS.value+1;
  await Future.delayed(const Duration(seconds: 1),);
  if (dataS.value >= 0.0 ) {
  print("=======> data2  ${dataS.value.toString()}");
  return dataS.value + await startSec(); //function call itself.
  }
  }
}

Future tenXF()async
{
  checkDoubleOrNot.value=true;

  if(tenX.value==true&&stop.value==false) {

    dataS.value=dataS.value+1.1;
    await Future.delayed(const Duration(seconds: 1),);
      if (dataS.value >= 0.0 ) {
        print("=======> data2  ${dataS.value.toString()}");
        return dataS.value + await tenXF(); //function call itself.
      }
    }
  }

  Future twentyXF()async
  {
    checkDoubleOrNot.value=true;

    if(twentyX.value==true&&stop.value==false) {
      dataS.value=dataS.value+1.2;
      await Future.delayed(const Duration(seconds: 1),);
      if (dataS.value >= 0.0 ) {

        print("=======> data3  ${dataS.value.toString()}");
        data.value=dataS.value.toInt();

        return dataS.value + await twentyXF(); //function call itself.
      }
    }
  }
}
