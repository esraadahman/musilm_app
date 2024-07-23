import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/features/chat/ui/widgets/chat/ImageMessage.dart';
import 'package:qurana/features/chat/ui/widgets/chat/textMessage.dart';

class ShowMessage extends StatefulWidget {
  const ShowMessage({super.key});

  @override
  State<ShowMessage> createState() => _ShowMessageState();
}

class _ShowMessageState extends State<ShowMessage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: colors.back_background,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    size.height(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextMessage(
                          username: 'esraa',
                          time: '13:00',
                          message: 'hi',
                          seen: false,
                          isSender: false,
                        ),
                      ],
                    ),
                    size.height(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // TextMessage(
                        // username: 'mai',
                        //   time: '12:00',
                        //   message: 'hello',
                        //   seen: true,
                        //   isSender: true,
                        // ),
                        ImageMessage(
                          username: "mai",
                          time: "3:00",
                          messageUrl: "images/Rectangle9.png",
                          seen: false,
                          isSender: true,
                          isVideo: false,
                        )
                      ],
                    ),
                  ],
                );
              },
            )));
  }
}
