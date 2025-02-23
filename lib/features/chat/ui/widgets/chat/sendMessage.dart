import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/features/chat/cubit/chat/cubit/chat_cubit.dart';
import 'package:qurana/features/chat/ui/widgets/chat/woltWidget.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:qurana/core/theming/style.dart';

class SendMessage extends StatefulWidget {
  String chatid;
  SendMessage({super.key, required this.chatid});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ChatCubit>(context);
          return Container(
              margin: EdgeInsets.only(bottom: 0, left: 30.w),
              height: 50.h,
              //  width: 350.sp,
              width: MediaQuery.sizeOf(context).width,
              color: colors.background,
             child:
              Padding(
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
                                  child: WoltWidget(cubit: cubit, chatid: widget.chatid,),
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
                        controller: cubit.message,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          hintStyle:
                              textstyle.subtitle.copyWith(fontSize: 15.sp),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    size.width(10.w),
                    // voice icon
                    GestureDetector(
                        onTap: () {},
                        child:
                            Icon(Icons.mic, size: 20.sp, color: colors.text)),
                    size.width(10.w),
                    // send icon
                    GestureDetector(
                        onTap: () {
                          // send massage
                           cubit.sendMessage(
                            widget.chatid, cubit.message.text, "text");
                          cubit.message.clear();
                        },
                        child:
                            Icon(Icons.send, size: 20.sp, color: colors.text)),
                  ])
                  )
                  );
        },
      ),
    );
  }
}
