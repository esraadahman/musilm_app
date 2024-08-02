import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/routing/router.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/features/chat/cubit/chat/cubit/chat_cubit.dart';
import 'package:qurana/features/chat/cubit/chats/cubit/chats_cubit.dart';
import 'package:qurana/features/chat/ui/widgets/chat/sendMessage.dart';
import 'package:qurana/features/chat/ui/widgets/chat/showMessages.dart';
import 'package:qurana/features/chat/ui/widgets/userInfo.dart';

class SingleChat extends StatefulWidget {
  String imgPath;
  String userName;
  String chat_id;
  String userid;

  SingleChat({
    super.key,
    required this.userid,
    required this.chat_id,
    required this.imgPath,
    required this.userName,
  });

  @override
  State<SingleChat> createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChat> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..set_chatid(widget.chat_id),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ChatCubit>(context);
          cubit.getallmessages(widget.chat_id);
          return Scaffold(
            backgroundColor: colors.back_background,
            floatingActionButton: SendMessage(
              chatid: widget.chat_id,
            ),
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
                          size: 25.sp,
                          color: colors.text,
                        ),
                      ),
                      size.width(5.w),
                      UserInfo(
                          imgPath: widget.imgPath,
                          userName: widget.userName,
                          other: ""),
                      size.width(15.w),
                      Icon(
                        Icons.call_outlined,
                        size: 25.sp,
                        color: colors.text,
                      ),
                      size.width(10.w),
                      Icon(
                        Icons.videocam_outlined,
                        size: 25.sp,
                        color: colors.text,
                      ),
                    ],
                  ),

                  // contant of chat
                  Container(
                      height: MediaQuery.sizeOf(context).height * .68,
                      child: ShowMessage(
                        chatid: widget.chat_id,
                        cubit: cubit,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
