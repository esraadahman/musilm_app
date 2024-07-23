import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:qurana/core/theming/style.dart';


class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 5.w, left: 30.w),
        height: 50.h,
        //  width: 350.sp,
        width: MediaQuery.sizeOf(context).width,
        color: colors.background,
        child: Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Row(children: [
              GestureDetector(
                  onTap: () {
                    WoltModalSheet.show<void>(
                      context: context,
                      pageListBuilder: (modalSheetContext) {
                        return [
                          WoltModalSheetPage(
                            backgroundColor: colors.back_background,
                            child: Container(
                              height: 200.h,
                              child: Column(
                                children: [
                                  size.height(10),
                                  // take photo
                                  GestureDetector(
                                    onTap: () {
                                      // firebase_chats.takeanduploadimage(
                                      //     widget.chatid!, true);
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.camera_alt_outlined,
                                          size: 25.sp, color: colors.text),
                                      title: Text('Take photo',
                                          style: textstyle.subtitle.copyWith(
                                              fontSize: 15.sp,
                                              color: colors.text,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  size.height(10),
                                  // upload photo
                                  GestureDetector(
                                    onTap: () {
                                      // firebase_chats.takeanduploadimage(
                                      //     widget.chatid!, false);
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.image,
                                          size: 25.sp, color: colors.text),
                                      title: Text('Upload image',
                                          style: textstyle.subtitle.copyWith(
                                              fontSize: 15.sp,
                                              color: colors.text,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  size.height(10),
                                  // upload video
                                  GestureDetector(
                                    onTap: () {
                                      // firebase_chats
                                      //     .uploadvideo(widget.chatid!);
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.video_collection,
                                          size: 25.sp, color: colors.text),
                                      title: Text('Upload video',
                                          style: textstyle.subtitle.copyWith(
                                              fontSize: 15.sp,
                                              color: colors.text,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ];
                      },
                    );
                  },
                  child: Icon(Icons.add_circle_outline,
                      size: 25.sp, color: colors.text)),
              size.width(7.w),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: textstyle.subtitle.copyWith(fontSize: 15.sp),
                    border: InputBorder.none,
                  ),
                ),
              ),
              size.width(10.w),
              // voice icon
              GestureDetector(
                  onTap: () {
                  },
                  child: Icon(Icons.mic,
                      size: 20.sp, color: colors.text)),
              size.width(10.w),
              // send icon
              GestureDetector(
                  onTap: () {
                    // send massage
                  },
                  child: Icon(Icons.send, size: 20.sp, color: colors.text)),
            ])));
  }
}
