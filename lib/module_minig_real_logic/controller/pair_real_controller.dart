import 'package:get/get.dart';

class PairRealController extends GetxController
{
  RxList<String> dataBaseKey=["firstKey","secondKey","thirdKey","fourthKey","fifthKey"].obs;
  RxList<String> currencyImage=["asset/bitcoin.jpeg","asset/eth.jpeg","asset/lite.jpeg","asset/shibu.jpeg","asset/zcash.jpeg"].obs;
  RxList<String> currencyName=["Bit coin","Etherium Coin","Lite Coin","Shibu Coin","Z-Cash Coin"].obs;
}