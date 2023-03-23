import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharePreference
{
///---------------------->add data

  //Saving String value
   addStringToSF(String key,String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  //Saving int value
   addIntToSF(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', data);
  }

  //Saving double value
  addDoubleToSF(double data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('doubleValue', data);
  }

  //Saving boolean value
  addBoolToSF(String key,bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', data);
  }
  ///------------------------------>  Read data
  Future<String> getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key??"");
    return stringValue ??"";
  }

   Future<bool> getBoolValuesSF(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    // bool? boolValue = prefs.getBool('boolValue');
    bool? boolValue = prefs.getBool(data);

    return boolValue ?? false;
  }

  getIntValuesSF(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt('intValue');
    return intValue;
  }

  getDoubleValuesSF(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double? doubleValue = prefs.getDouble('doubleValue');
    return doubleValue;
  }
}

//removeValues() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Remove String
//   prefs.remove("stringValue");
//   //Remove bool
//   prefs.remove("boolValue");
//   //Remove int
//   prefs.remove("intValue");
//   //Remove double
//   prefs.remove("doubleValue");
// }