import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  // RxInt tenXValue = 1100.obs;
  // RxInt twentyXValue = 1100.obs;
  SharePreference sharePreference = SharePreference();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    super.onInit();

    ///-----> typeIncrementForGet
    typeIncrementForGet();

    ///----->catch data and formula
    finalTime();

    ///------>check double of not...much more

    String checkIsBoole=await sharePreference.getStringValuesSF("storeData1");

    // finalY.value.toString().isNotEmpty? (firstCheck.value=="true"? finalY.value=finalY.value*1:(checkStarSec.value=="true"?finalY.value=finalY.value*1:(check10x.value=="true"? finalY.value=int.parse((finalY.value*1.2).toString()):finalY.value=int.parse((finalY.value*1.2).toString())))):"";
    var pastPlusCurrent = checkIsBoole.contains('.')? double.parse(await sharePreference.getStringValuesSF("storeData1"))+finalY.value:int.parse(await sharePreference.getStringValuesSF("storeData1"))+finalY.value ;
    String pastPlusCurrentS=pastPlusCurrent.toString();
    print("=== pastPlusCurrent ===>$pastPlusCurrentS");

    pastPlusCurrentS.contains(".")
        ? dataSe.value = double.parse(pastPlusCurrentS.toString())
        : data.value = int.parse(pastPlusCurrentS.toString());
    String converter = dataSe.toStringAsFixed(1);
    dataS.value = double.parse(converter.toString());

    pastPlusCurrentS.contains(".")
        ? checkDoubleOrNot.value = true
        : checkDoubleOrNot.value = false;


    pastPlusCurrentS.contains(".") ? (checkStarSec.value=="true"? start.value = true:(check10x.value=="true"? tenX.value = true:(check20x.value=="true"?twentyX.value = true:""))): start.value = true;

    pastPlusCurrentS.contains(".") ? (checkStarSec.value=="true"? startSec():(check10x.value=="true"? tenXF():twentyXF())): startF();



    print("=========start=======>${start.value.toString()}");
    print("=======tenX=========>${tenX.value.toString()}");
    print("=========twentyX=======>${twentyX.value.toString()}");

    print("store data=================>${pastPlusCurrentS.toString()}");
    print("store dataS=================>${dataS.value.toString()}");
    print("store data=================>${data.value.toString()}");
  }

  Future currentTime() async {
    String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());

    log("current date============>${addCurrent}");

    List<String> splitList = addCurrent.split(':');

    hour.value=int.parse(splitList[0]);
    min.value=int.parse(splitList[1]);
    sec.value=int.parse(splitList[2]);

    await sharePreference.addStringToSF("hour", hour.value.toString());
    await sharePreference.addStringToSF("min", min.value.toString());
    await sharePreference.addStringToSF("sec", sec.value.toString());

    Future.delayed(Duration(seconds: 1)).then((value) async {
      String ho = await sharePreference.getStringValuesSF("hour");
      String mi = await sharePreference.getStringValuesSF("min");
      String se = await sharePreference.getStringValuesSF("sec");
      // return currentTime();
    });
  }

  Future finalTime()
  async {
    ///-------->past na data

    hourPast.value= int.parse(await sharePreference.getStringValuesSF("hour"));
    minPast.value= int.parse(await sharePreference.getStringValuesSF("min"));
    secPast.value= int.parse(await sharePreference.getStringValuesSF("sec"));


    log("====hourPast.valu=====> ${hourPast.value}");
    log("====minPast.value=====> ${minPast.value}");
    log("====secPast.value=====> ${secPast.value}");

    ///-------->current data

    String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());

    log("current date============>${addCurrent}");

    List<String> splitList = addCurrent.split(':');

    int hour=int.parse(splitList[0]);
    int min=int.parse(splitList[1]);
    int sec=int.parse(splitList[2]);

    ///-------->final result
    var a=hour-hourPast.value;
    var b=min-minPast.value;
    var c=sec-secPast.value;

    log("======= a ========> ${a}");
    log("======== b =======> ${b}");
    log("======== c =======> ${c}");

    DateTime startDate = DateFormat("HH:mm:ss").parse("${hour.toString()}:${min.toString()}:${sec.toString()}");
    DateTime endDate = DateFormat("HH:mm:ss").parse("${hourPast.value}:${minPast.value}:${secPast.value}");

    Duration dif = endDate.difference(startDate);

    print(dif.inSeconds);

    var d=dif.inSeconds.abs();
    finalY.value=d.abs();

    print("var d================================================> ${d}");
  }

  Future typeIncrementForStore(bool? first,bool? firstSec,bool? tenXs ,bool? twentyX)
  async {
    await sharePreference.addStringToSF("checkStart", first.toString());

    await sharePreference.addStringToSF("checkStarSec", firstSec.toString());

    await sharePreference.addStringToSF("check10x", tenXs.toString());

    await sharePreference.addStringToSF("check20x", twentyX.toString());

  }

  typeIncrementForGet()
  async {
    firstCheck.value   = await sharePreference.getStringValuesSF("checkStart");
    checkStarSec.value  = await sharePreference.getStringValuesSF("checkStarSec");
    check10x.value     = await sharePreference.getStringValuesSF("check10x");
    check20x.value     = await sharePreference.getStringValuesSF("check20x");

    log("firstCheck.value : ${firstCheck.value}");
    log("checkStarSec.value : ${checkStarSec.value}");
    log("check10x.value: ${check10x.value}");
    log("check20x.value : ${check20x.value}");
  }

  Future sharePrefWhenOpenApp() async {
    if (data.value >= dataS.value) {
      storeData.value = data.value.toString();
    } else {
      storeData.value = dataS.value.toString();
    }
    await sharePreference.addStringToSF("storeData1", storeData.value);
    storeData.value = await sharePreference.getStringValuesSF("storeData1");
  }

  Future startF() async {
    if (start.value == true && stop.value == false && dataS.value <= 0.0) {
      checkDoubleOrNot.value = false;
      currentTime();
      typeIncrementForStore(true,false,false,false);

      data.value++;
      sharePrefWhenOpenApp();
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (data.value >= 0) {
        print("=======> data1  ${data.value.toString()}");
        // print(" datas==============> ${dataS.value}");
        return data.value + await startF(); //function call itself.
      }
    }
  }

  Future startSec() async {
    if (start.value == true && stop.value == false) {
      checkDoubleOrNot.value = true;
      currentTime();
      typeIncrementForStore(false,true,false,false);

      dataS.value = dataS.value + 1;
      sharePrefWhenOpenApp();
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (dataS.value >= 0.0) {
        // print("=======> data2  ${dataS.value.toString()}");
        return dataS.value + await startSec(); //function call itself.
      }
    }
  }

  Future tenXF() async {
    checkDoubleOrNot.value = true;

    if (tenX.value == true && stop.value == false) {
      dataS.value = dataS.value + 1.1;
      sharePrefWhenOpenApp();
      currentTime();
      typeIncrementForStore(false,false,true,false);

      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (dataS.value >= 0.0) {
        // print("=======> data2  ${dataS.value.toString()}");
        return dataS.value + await tenXF(); //function call itself.
      }
    }
  }

  Future twentyXF() async {
    checkDoubleOrNot.value = true;

    if (twentyX.value == true && stop.value == false) {
      dataS.value = dataS.value + 1.2;
      sharePrefWhenOpenApp();
      typeIncrementForStore(false,false,false,true);

      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (dataS.value >= 0.0) {
        // print("=======> data3  ${dataS.value.toString()}");
        data.value = dataS.value.toInt();
        return dataS.value + await twentyXF(); //function call itself.
      }
    }
  }
}
