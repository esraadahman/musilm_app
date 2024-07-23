import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/style.dart';

class ChatHeader extends StatelessWidget {
  String text;
   ChatHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                  child: Text(
                    text,
                    style: textstyle.maintitle.copyWith(fontSize: 28.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 10.h),
                  child: Icon(
                    Icons.add_circle_outline_sharp,
                    size: 30.sp,
                    color: colors.text,
                  ),
                )
              ],
            );
  }
}