import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/routing/router.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/features/chat/ui/screens/Profile.dart';

class UserInfo extends StatelessWidget {
  String imgPath;
  String userName;
  String other;

  UserInfo(
      {super.key,
      required this.imgPath,
      required this.userName,
      required this.other});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(ProfileScreen(
          name: userName,
          imagepath: imgPath,
          email: "esraa@",
          phone: '123456789',
          info: 'cairo',
          lastSeen: 'soon',
        ));
      },
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 30.r,
            //  backgroundImage: AssetImage("images/Rectangle5.png"),
            backgroundImage: NetworkImage(imgPath),
          ),
          size.width(5),
          Column(
            children: [
              Text(
                userName,
                style: textstyle.maintitle.copyWith(
                  fontSize: 20,
                ),
              ),
              Text(
                other,
                style: textstyle.subtitle
                    .copyWith(fontSize: 15, color: colors.text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
