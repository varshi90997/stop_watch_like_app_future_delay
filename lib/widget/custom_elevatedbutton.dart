import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const CustomElevatedButton({Key? key,this.text,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black54,
            minimumSize: Size(20.h, 8.h),
            shadowColor: Colors.black,
            elevation: 2,
            side: const BorderSide(color: Colors.black)),
        onPressed: onPressed,
        child:  Text(
          text??"",
        ));

  }
}
