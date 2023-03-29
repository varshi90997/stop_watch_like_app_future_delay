import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';

class TimerController extends GetxController {

  RxString backPageKey="".obs;

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

  RxList<dynamic> storeInSharePre=<dynamic>["hour--0","min--1","sec--2","firstCheck--3","checkStarSec--4","check10x--5","check20x--6","live score--7",false].obs;

  // RxInt tenXValue = 1100.obs;
  // RxInt twentyXValue = 1100.obs;
  SharePreference sharePreference = SharePreference();
  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;


  Future<void> callInInit()
  async {

    log("======== pass arguments as controller==========>${backPageKey.value}");

    ///-----> list m add krya all parameters
    await getInSharePrFunction();

    ///-----> 4 type add
    await typeIncrementForGet();

    ///----->hour,min,sec 3 add &&catch data and formula
    await finalTime();

    ///------>check double of not...much more
    // String checkIsBoole=await sharePreference.getStringValuesSF("storeData1");
    // print("====past second value======>$checkIsBoole");
    String checkIsBoole=storeInSharePre[7].toString();
    String f1=storeInSharePre[3];
    print("====past second value======>$checkIsBoole");
    print("====past second value======>$f1");


    // finalY.value.toString().isNotEmpty? (firstCheck.value=="true"? finalY.value=finalY.value*1:(checkStarSec.value=="true"?finalY.value=finalY.value*1:(check10x.value=="true"? finalY.value=int.parse((finalY.value*1.2).toString()):finalY.value=int.parse((finalY.value*1.2).toString())))):"";
    var pastPlusCurrent = checkIsBoole.contains('.')?(checkStarSec.value=="true" ? double.parse(storeInSharePre[7])+finalY.value*1:(check10x.value=="true"?double.parse(storeInSharePre[7])+finalY.value*1.1:double.parse(storeInSharePre[7])+finalY.value*1.2)) :  int.parse(storeInSharePre[7])+finalY.value ;

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

    // pastPlusCurrentS.contains(".") ? (checkStarSec.value=="true"? startSec():(check10x.value=="true"? tenXF():twentyXF())): startF();

    if(pastPlusCurrentS.contains("."))
    {
      if(checkStarSec.value=="true")
      {
        if (buttonEnabled3.value == true) {
          buttonEnabled3.value = false;
          await startSec().whenComplete(() {
            buttonEnabled3.value = true;
          });
        }
      }
      else if(check10x.value=="true")
      {
        if (buttonEnabled1.value == true) {
          buttonEnabled1.value = false;
          await tenXF().whenComplete(() {
            buttonEnabled1.value = true;
          });
        }
      }
      else if(check20x.value=="true")
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
      if(firstCheck.value=="true")
      {
        if (buttonEnabled.value == true) {
          buttonEnabled.value = false;
          await startF().whenComplete(() {
            buttonEnabled.value = true;
          });
        }
      }
    }
    print("=========start=======>${start.value.toString()}");
    print("=======tenX=========>${tenX.value.toString()}");
    print("=========twentyX=======>${twentyX.value.toString()}");

    print("store data=================>${pastPlusCurrentS.toString()}");
    print("store dataS=================>${dataS.value.toString()}");
    print("store data=================>${data.value.toString()}");
  }

  Future currentTime() async {
    String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());

    log("current date currentTime ============>${addCurrent}");

    List<String> splitList = addCurrent.split(':');

    hour.value=int.parse(splitList[0]);
    min.value=int.parse(splitList[1]);
    sec.value=int.parse(splitList[2]);

    storeInSharePre[0]=hour.value.toString();
    storeInSharePre[1]=min.value.toString();
    storeInSharePre[2]=sec.value.toString();
    storeInSharePre[8]=stop.value;
    storeInSharePrFunction();

  }
  Future finalTime()
  async {
    ///-------->past na data

    hourPast.value=int.parse(storeInSharePre[0]);
    minPast.value= int.parse(storeInSharePre[1]);
    secPast.value= int.parse(storeInSharePre[2]);

    log("====hourPast.valu=====> ${hourPast.value}");
    log("====minPast.value=====> ${minPast.value}");
    log("====secPast.value=====> ${secPast.value}");

    ///-------->current data

    String addCurrent = DateFormat("HH:mm:ss").format(DateTime.now());

    log("current date finalTime============>${addCurrent}");

    List<String> splitList = addCurrent.split(':');

    int hour=int.parse(splitList[0]);
    int min=int.parse(splitList[1]);
    int sec=int.parse(splitList[2]);

    ///-------->final result


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
    storeInSharePre[3]=first.toString();
    storeInSharePre[4]=firstSec.toString();
    storeInSharePre[5]=tenXs.toString();
    storeInSharePre[6]=twentyX.toString();
    storeInSharePrFunction();

  }

  typeIncrementForGet()
  async {
    firstCheck.value   = storeInSharePre[3];
    checkStarSec.value = storeInSharePre[4];
    check10x.value     = storeInSharePre[5];
    check20x.value     = storeInSharePre[6];

    log("firstCheck.value : ${firstCheck.value}");
    log("checkStarSec.value : ${checkStarSec.value}");
    log("check10x.value: ${check10x.value}");
    log("check20x.value : ${check20x.value}");
  }

  storeInSharePrFunction()
  async {
    String encodeD=jsonEncode(storeInSharePre);
    await sharePreference.addStringToSF(backPageKey.value.toString(), encodeD);
  }

  getInSharePrFunction()
  async {
    String decodeD = await sharePreference.getStringValuesSF(backPageKey.value.toString());
    storeInSharePre.value=List.from(jsonDecode(decodeD));

    stop.value = storeInSharePre[8];
    //List.from(jsonDecode(get));
    print("=>>>>>>> storeInSharePre >>>>>>>> $storeInSharePre");
  }

  Future sharePrefWhenOpenApp() async {
    if (data.value >= dataS.value) {
      storeData.value = data.value.toString();
    } else {
      storeData.value = dataS.value.toString();
    }

    storeInSharePre[7]=storeData.value;
    storeInSharePrFunction();
    storeData.value = storeInSharePre[7];
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
        print(" datas==============> ${dataS.value}");
        return data.value + await startF()??0; //function call itself.
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
        print("=======> data2  ${dataS.value.toString()}");
        return dataS.value + await startSec()??0; //function call itself.
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
        print("=======> data3  ${dataS.value.toString()}");
        return dataS.value + await tenXF()??0; //function call itself.
      }
    }
  }

  Future twentyXF() async {
    checkDoubleOrNot.value = true;

    if (twentyX.value == true && stop.value == false) {
      dataS.value = dataS.value + 1.2;
      sharePrefWhenOpenApp();
      currentTime();
      typeIncrementForStore(false,false,false,true);

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

