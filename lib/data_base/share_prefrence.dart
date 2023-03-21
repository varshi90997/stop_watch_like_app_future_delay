import 'package:shared_preferences/shared_preferences.dart';

class SharePreference
{
///---------------------->add data

  //Saving String value
  addStringToSF(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', data);
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
  addBoolToSF(bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', data);
  }


  ///------------------------------>  Read data
  getStringValuesSF(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('stringValue');
    return stringValue;
  }

  getBoolValuesSF(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool('boolValue');
    return boolValue;
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