import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/routing/router.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/features/chat/ui/widgets/chat/sendMessage.dart';
import 'package:qurana/features/chat/ui/widgets/chat/showMessages.dart';
import 'package:qurana/features/chat/ui/widgets/userInfo.dart';

class SingleChat extends StatefulWidget {
  String imgPath;
  String userName;

  SingleChat({
    super.key,
    required this.imgPath,
    required this.userName,
  });

  @override
  State<SingleChat> createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.back_background,
      floatingActionButton: SendMessage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            size.height(45.h),
            Row(
              children: [
                size.width(20.w),
                GestureDetector(
                  onTap: () {
                    context.goBack();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.sp,
                    color: colors.text,
                  ),
                ),
                size.width(10.w),
                UserInfo(imgPath: "", userName: "", other: ""),
                size.width(15.w),
                Icon(
                  Icons.call_outlined,
                  size: 30.sp,
                  color: colors.text,
                ),
                size.width(20.w),
                Icon(
                  Icons.videocam_outlined,
                  size: 30.sp,
                  color: colors.text,
                ),
              ],
            ),
        
        
            // contant of chat
            Container(
        height: MediaQuery.sizeOf(context).height*.68,
        child: ShowMessage()),
          
          ],
        ),
      ),
    );
  }
}
