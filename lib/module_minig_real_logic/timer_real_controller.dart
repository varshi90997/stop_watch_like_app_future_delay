import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';
import 'package:stop_watch_like_app/module_minig_real_logic/model/real_model.dart';

class RealTimerController extends GetxController
{

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
  RxBool buttonEnabled3 = true.obs;

  RxString currentDate = "".obs;
  RxString pastDate = "".obs;

  RxString storeData = "".obs;
  RxInt finalY=0.obs;
  RxBool stop = false.obs;

  RxInt hour=0.obs;
  RxInt min=0.obs;
  RxInt sec=0.obs;
  RxInt hourPast=0.obs;
  RxInt minPast=0.obs;
  RxInt secPast=0.obs;

  //for check start or 10x or 20x for bool
  RxString firstCheck="".obs;
  RxString checkStarSec="".obs;
  RxString check10x= "".obs;
  RxString check20x="".obs;
  RxList<TimerModel> timerModelList=<TimerModel>[].obs;
  SharePreference sharePreference=SharePreference();

  // @override
  // Future<void> onInit() async {
  //   // TODO: implement onInit
  //   super.onInit();
  //
  //   await getInSharePrFunction();
  //   print("funvction  called");
  // }

  Future storeInSharePrFunction()
  async {
    String encodeD=jsonEncode(timerModelList.map((value) => value.toJson()).toList());//---->[{currentTime: 16:10:56, endTime: , isCurrent: true, value: 0, isStart: true, speed: 1}]
    await sharePreference.addStringToSF("Test", encodeD);
  }

  getInSharePrFunction()
  async {
    String decodeD = await sharePreference.getStringValuesSF("Test");

    List decodedSec=List.from(jsonDecode(decodeD));
    timerModelList.value=List.from(decodedSec.map((json) => TimerModel.fromJson(json)).toList());//------> [Instance of 'TimerModel']

    print("=>>>>>>> storeInSharePre >>>>>>>> $timerModelList");
    getTimeDif();
    }

    getTimeDif()
    {
      DateTime startDate = DateFormat("HH:mm:ss").parse(timerModelList[timerModelList.length-2].currentTime.toString());
      print("========> start date time ${timerModelList[timerModelList.length-2].currentTime.toString()}");
      DateTime endDate = DateFormat("HH:mm:ss").parse(timerModelList[timerModelList.length-1].currentTime.toString());
      print("========> end date time ${timerModelList[timerModelList.length-1].currentTime.toString()}");


      Duration dif = endDate.difference(startDate);

      print(dif.inSeconds);

      var d=dif.inSeconds.abs();
      String finalDif=d.abs().toString();
      finalDif.toString().contains(".")? dataS.value=double.parse(finalDif.toString()) : data.value=int.parse(finalDif.toString());

      print("=====finalY.value======> ${finalDif}");


      timerModelList[timerModelList.length-2].speed.toString().contains(".")?(timerModelList[timerModelList.length-2].speed=="1" ? start.value = true:(timerModelList[timerModelList.length-2].speed=="1.1"?tenX.value = true:twentyX.value = true )) :start.value = true;
      timerModelList[timerModelList.length-2].speed.toString().contains(".")?(timerModelList[timerModelList.length-2].speed=="1" ? startSec():(timerModelList[timerModelList.length-2].speed=="1.1"?tenXF():twentyXF())) :startF();
    }

  Future startF() async {
    if (start.value == true && stop.value == false && dataS.value <= 0.0) {
      checkDoubleOrNot.value = false;
      // currentTime();
      // typeIncrementForStore(true,false,false,false);
      data.value++;
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (data.value >= 0) {
        print("=======> data1  ${data.value.toString()}");
        print(" datas==============> ${dataS.value}");
        return data.value + await startF()??0; //function call itself.
      }
    }
  }

  Future startSec() async {
    if (start.value == true && stop.value == false) {
      checkDoubleOrNot.value = true;
      // currentTime();
      // typeIncrementForStore(false,true,false,false);

      dataS.value = dataS.value + 1;
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (dataS.value >= 0.0) {
        print("=======> data2  ${dataS.value.toString()}");
        return dataS.value + await startSec()??0; //function call itself.
      }
    }
  }

  Future tenXF() async {
    checkDoubleOrNot.value = true;

    if (tenX.value == true && stop.value == false) {
      dataS.value = dataS.value + 1.1;
      // sharePrefWhenOpenApp();
      // currentTime();
      // typeIncrementForStore(false,false,true,false);

      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (dataS.value >= 0.0) {
        print("=======> data3  ${dataS.value.toString()}");
        return dataS.value + await tenXF()??0; //function call itself.
      }
    }
  }

  Future twentyXF() async {
    checkDoubleOrNot.value = true;

    if (twentyX.value == true && stop.value == false) {
      dataS.value = dataS.value + 1.2;
      // sharePrefWhenOpenApp();
      // currentTime();
      // typeIncrementForStore(false,false,false,true);

      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (dataS.value >= 0.0) {
        print("=======> data4  ${dataS.value.toString()}");
        data.value = dataS.value.toInt();
        return dataS.value + await twentyXF()??0; //function call itself.
      }
    }
  }
}
