import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/core/theming/size.dart';

class TextMessage extends StatelessWidget {
  String? username;
  String? time;
  String? message;
  bool? seen;
  bool? isSender;

  TextMessage(
      {super.key,
      required this.username,
      required this.time,
      required this.message,
      required this.seen,
      required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .5,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 20, left: 10),
      decoration: BoxDecoration(
        color: isSender! ? colors.background : colors.primary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: isSender == false? Radius.circular(20) : Radius.circular(0),
            bottomLeft:isSender==true? Radius.circular(20): Radius.circular(0)),
      ),
      child: Column(
        children: [
          size.height(2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                username!,
                style: textstyle.subtitle
                    .copyWith(fontSize: 12.sp, color: colors.text),
              ),
              size.width(10.w),
            ],
          ),
          Container(
              width: MediaQuery.sizeOf(context).width * .5,
              height: message!.length<20?20.h:message!.length*2.h,
            child: Text(
              message!,
              style: textstyle.maintitle
                  .copyWith(fontSize: 17.sp, color: colors.text),
            ),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              size.width(5.w),
              Text(
                time!,
                style: textstyle.subtitle
                    .copyWith(fontSize: 12.sp, color: colors.text),
              ),
              size.width(80.w),
              Icon(
              seen==true?  Icons.done_all:Icons.done,
                color: colors.text,
              )
            ],
          )
        ],
      ),
    );
  }
}
