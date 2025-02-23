import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  String? username;
  String? lastSeen;
  String? email;
  String? info;
  String? phone;

  ProfileBody(
      {super.key,
      required this.username,
      required this.lastSeen,
      required this.info,
      required this.email,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Name -: ${username}",
          style: textstyle.maintitle.copyWith(fontSize: 20.sp),
        ),
        size.height(5),
        Text(
          "  Last Seen\n ${lastSeen}",
          style: textstyle.subtitle.copyWith(fontSize: 17.sp),
        ),
        size.height(20),
        Text(
          "Information About -: ${info}",
          style: textstyle.subtitle.copyWith(fontSize: 17.sp),
        ),
        //user email
        size.height(20),
        Row(
      //    mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              size.width(MediaQuery.of(context).size.width * 0.2),

            // email icon
            Icon(
              Icons.email_outlined,
              size: 20.sp,
              color: colors.text,
            ),
              size.width(10.w),
            Text(
              " ${email}",
              style: textstyle.maintitle.copyWith(fontSize: 15.sp),
            ),
          ],
        ),
        size.height(20),
        Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            size.width(MediaQuery.of(context).size.width * 0.2),

            // phone icon
            Icon(
              Icons.call_outlined,
              size: 20.sp,
              color: colors.text,
            ),
              size.width(10.w),
            Text(
              '    ${phone}',
              style: textstyle.maintitle.copyWith(fontSize: 15.sp),
            ),
          ],
        ),
        //user phone number
      ],
    );
  }
}
