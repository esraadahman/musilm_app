import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/routing/router.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/features/chat/ui/widgets/chat/sendMessage.dart';
import 'package:qurana/features/chat/ui/widgets/chat/showMessages.dart';
import 'package:qurana/features/chat/ui/widgets/profile/buttons.dart';
import 'package:qurana/features/chat/ui/widgets/profile/profileBody.dart';
import 'package:qurana/features/chat/ui/widgets/profile/profileHead.dart';
import 'package:qurana/features/chat/ui/widgets/userInfo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.back_background,
        body: Column(children: [
          ProfileHeader(
            imagePath: 'images/Rectangle14.png',
          ),

          // user name
          ProfileBody(
            username: 'Esraa',
            lastSeen: 'one hour ago',
            info: 'Egypt',
            email: 'esraadahman.com',
            phone: '12345678',
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
        ]));
  }
}
