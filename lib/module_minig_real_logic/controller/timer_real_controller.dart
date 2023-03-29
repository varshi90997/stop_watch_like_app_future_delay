import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';
import 'package:stop_watch_like_app/module_minig_real_logic/model/real_model.dart';

class RealTimerController extends GetxController
{
  RxString backPageKey="".obs;
  RxDouble dataSe = 0.0.obs;
  RxDouble dataS = 0.0.obs;
  RxInt data = 0.obs;

  RxInt isCheckTen = 0.obs;
  RxInt isCheckTwenty = 0.obs;

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
  RxString speed="".obs;
  RxString valueC="".obs;

  RxList<TimerModel> timerModelList=<TimerModel>[].obs;
  SharePreference sharePreference=SharePreference();


@override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;

  Future storeInSharePrFunction()
  async {
    timerModelList.removeRange(0, timerModelList.length-3);

    String encodeD=jsonEncode(timerModelList.map((value) => value.toJson()).toList());//---->[{currentTime: 16:10:56, endTime: , isCurrent: true, value: 0, isStart: true, speed: 1}]
    await sharePreference.addStringToSF(backPageKey.value, encodeD);
  }

  getInSharePrFunction()
  async {
    String decodeD = await sharePreference.getStringValuesSF(backPageKey.value);

    List decodedSec=List.from(jsonDecode(decodeD));
    timerModelList.value=List.from(decodedSec.map((json) => TimerModel.fromJson(json)).toList());//------> [Instance of 'TimerModel']

    print("=>>>>>>> storeInSharePre >>>>>>>> $timerModelList");
    stop.value=timerModelList[timerModelList.length-1].isStart;
    speed.value=timerModelList[timerModelList.length-1].speed;

    if(stop.value==true)
      {
        getDif();
      }
    else
      {
        getTimeDif();
      }
    }

    getTimeDif()
    async {

      String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());

      DateTime startDate = DateFormat("HH:mm:ss").parse(addCurrent);
      print("========> start date time ${addCurrent}");
      DateTime endDate = DateFormat("HH:mm:ss").parse(timerModelList[timerModelList.length-1].currentTime.toString());
      print("========> end date time ${timerModelList[timerModelList.length-1].currentTime.toString()}");


      Duration dif = endDate.difference(startDate);

      print(dif.inSeconds);

      // int fistTwenty=0;
      // int afterTwenty=0;
      // for(int i=0;i<=dif.inSeconds.abs();i++)
      // {
      //   if(i<20)
      //     {
      //       fistTwenty++;
      //     }
      //   else
      //     {
      //       fistTwenty = fistTwenty + 1;
      //     }
      // }

      var d=dif.inSeconds.abs();
      String finalDif=d.abs().toString();

      print("can work maths======>");

      timerModelList[timerModelList.length-1].value.contains(".")?(timerModelList[timerModelList.length-1].speed=="1" ? dataS.value=double.parse(finalDif.toString())*1+double.parse(timerModelList[timerModelList.length-1].value):(timerModelList[timerModelList.length-1].speed=="1.1"?dataS.value=double.parse(finalDif.toString())*1.1+double.parse(timerModelList[timerModelList.length-1].value):dataS.value=double.parse(finalDif.toString())*1.2+double.parse(timerModelList[timerModelList.length-1].value) )) :data.value=int.parse(finalDif.toString())*1+int.parse(timerModelList[timerModelList.length-1].value);

      print("=====dataS.value======> $dataS");
      print("=====data.value======> $data");
      dataS.value>0.0? checkDoubleOrNot.value = true : checkDoubleOrNot.value = false;
      dataS.value>0.0? valueC.value=dataS.value.toString() : valueC.value=data.value.toString();
      print("=====checkDoubleOrNot.value.value======> ${checkDoubleOrNot.value}");

      print("=====valueC.value.value======> ${valueC.value}");
      //------->line no t deletable
      // valueC.value.toString().contains(".")?(timerModelList[timerModelList.length-1].speed=="1" ? start.value = true:(timerModelList[timerModelList.length-1].speed=="1.1"?tenX.value = true:twentyX.value = true )) :start.value = true;

      start.value = true;
      print("=====start.value======> ${start.value}");
      print("=====tenX.value======> ${tenX.value}");
      print("=====twentyX.value======> ${twentyX.value}");

      if(valueC.contains("."))
      {
        if(start.value == true)
        {
          if (buttonEnabled3.value == true) {
            buttonEnabled3.value = false;
            await startSec().whenComplete(() {
              buttonEnabled3.value = true;
            });
          }
        }
        else if(tenX.value == true)
        {
          if (buttonEnabled1.value == true) {
            buttonEnabled1.value = false;
            await tenXF().whenComplete(() {
              buttonEnabled1.value = true;
            });
          }
        }
        else if(twentyX.value == true)
        {
          if (buttonEnabled2.value == true) {
            buttonEnabled2.value = false;
            await twentyXF().whenComplete(() {
              buttonEnabled2.value = true;
            });
          }
        }
      }
      else
      {
        if(start.value == true)
        {
          if (buttonEnabled.value == true) {
            buttonEnabled.value = false;
            await startF().whenComplete(() {
              buttonEnabled.value = true;
            });
          }
        }
      }
    }

    getDif()
    {
      valueC.value=timerModelList[timerModelList.length-1].value;
      valueC.value.toString().contains(".") ? dataS.value=double.parse(valueC.value.toString()):data.value=int.parse(valueC.value.toString()) ;
      dataS.value>0.0? checkDoubleOrNot.value = true : checkDoubleOrNot.value = false;
      valueC.value.toString().contains(".")?(timerModelList[timerModelList.length-1].speed=="1" ? start.value = true:(timerModelList[timerModelList.length-1].speed=="1.1"?tenX.value = true:twentyX.value = true )) :start.value = true;
    }


  Future startF() async {
    if (start.value == true && stop.value == false && dataS.value <= 0.0) {
      checkDoubleOrNot.value = false;
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
      isCheckTen.value++;
      start.value=false;

      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (dataS.value >= 0.0&&isCheckTen.value<=10) {
        print("=======> data3  ${dataS.value.toString()}");
        return dataS.value + await tenXF()??0; //function call itself.
      }

      if(isCheckTen.value>10)
      {
        twentyX.value = false;
        tenX.value =false;
        start.value=true;
        isCheckTen.value=0;
        speed.value="1";
        String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
        timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: dataS.value.toString(), isStart: false, speed: "1"));
        storeInSharePrFunction();
        return dataS.value + await startSec()??0;
      }
    }
  }

  Future twentyXF() async {
    checkDoubleOrNot.value = true;
    if (twentyX.value == true && stop.value == false ) {
      dataS.value = dataS.value + 1.2;
      isCheckTwenty++;
      start.value=false;

      await Future.delayed(const Duration(seconds: 1),);

      if (dataS.value >= 0.0&&isCheckTwenty.value<=10) {
        print("=======> data4  ${dataS.value.toString()}");
        data.value = dataS.value.toInt();
        return dataS.value + await twentyXF()??0; //function call itself.
      }

      if(isCheckTwenty.value>10)
        {
          twentyX.value = false;
          tenX.value =false;
          start.value=true;
          isCheckTwenty.value=0;
          speed.value="1";
          String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());
          timerModelList.add(TimerModel(currentTime: addCurrent, endTime: "", isCurrent: true, value: dataS.value.toString(), isStart: false, speed: "1"));
          storeInSharePrFunction();
          return dataS.value + await startSec()??0;
        }
    }
  }
}
