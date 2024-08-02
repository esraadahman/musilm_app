import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/features/chat/ui/widgets/profile/buttons.dart';
import 'package:qurana/features/chat/ui/widgets/profile/profileBody.dart';
import 'package:qurana/features/chat/ui/widgets/profile/profileHead.dart';

class ProfileScreen extends StatefulWidget {
  String name;
  String imagepath;
  String lastSeen;
  String info;
  String email;
  String phone;

// info = location
  ProfileScreen(
      {required this.name,
      required this.imagepath,
      required this.email,
      required this.phone,
      required this.info,
      required this.lastSeen});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.back_background,
        body: SingleChildScrollView(
          child: Column(children: [
            ProfileHeader(
              imagePath: widget.imagepath,
            ),

            // user name
            ProfileBody(
              username: widget.name,
              lastSeen: widget.lastSeen,
              info: widget.lastSeen,
              email: widget.email,
              phone: widget.phone,
            ),

            // delete and block buttons
            size.height(40),
            Row(
              children: [
                size.width(MediaQuery.of(context).size.width * 0.1),
                // delete button
                GestureDetector(
                  onTap: () {},
                  child: Buttons(
                    text: 'Delete',
                    colorButton: colors.background,
                    colortext: colors.primary,
                  ),
                ),
                size.width(20.w),
                // block button
                GestureDetector(
                  onTap: () {},
                  child: Buttons(
                    text: 'Block',
                    colorButton: colors.primary,
                    colortext: colors.background,
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
