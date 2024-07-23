import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/style.dart';

class UsersSends extends StatefulWidget {
  String imgPath;
  String userName;
  String message;

   UsersSends({super.key, required this.imgPath, required this.userName, required this.message});

  @override
  State<UsersSends> createState() => _UsersSendsState();
}

class _UsersSendsState extends State<UsersSends> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30.r,
        backgroundImage: AssetImage("images/Rectangle5.png"),
      ),
      title: Text(
        "user name",
        style: textstyle.maintitle.copyWith(
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        "message",
        style: textstyle.subtitle.copyWith(fontSize: 15, color: colors.text),
      ),
      trailing: Text(
        "time",
        style: textstyle.subtitle.copyWith(fontSize: 15, color: colors.text),
      ),
    );
  }
}
