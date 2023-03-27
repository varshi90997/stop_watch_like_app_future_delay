import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_like_app/data_base/share_prefrence.dart';
import 'package:stop_watch_like_app/modules/controller/pair_controller.dart';
import 'package:stop_watch_like_app/modules/timer_page.dart';

class AllPairPage extends StatelessWidget {
   AllPairPage({Key? key}) : super(key: key);

  final PairController pairController = Get.put(PairController());

  SharePreference sharePreference = SharePreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 1.h,),
          Expanded(
            child: ListView.builder( physics: const AlwaysScrollableScrollPhysics(),shrinkWrap: true,itemCount: pairController.dataBaseKey.length,itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(TimerPage(),arguments: pairController.dataBaseKey[index]);
                },
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.all(2),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        SizedBox(width: 2.w,),
                        CircleAvatar(
                          backgroundColor: Colors.black54,
                          radius: 4.h,
                          backgroundImage: AssetImage(pairController.currencyImage[index]),
                        ),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        Text(pairController.currencyName[index],style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold)),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,color: Colors.black,),
                      ]),
                    ),
                  ),
                  const Divider(thickness: 3,color: Colors.black,indent: 2,endIndent: 2,)
                ],),
              );
            },),
          )
        ]),
      ),
    );
  }
}
