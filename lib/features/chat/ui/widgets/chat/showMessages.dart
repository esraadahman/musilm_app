import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/features/chat/cubit/chat/cubit/chat_cubit.dart';
import 'package:qurana/features/chat/data/network/single_chatNetwork.dart';
import 'package:qurana/features/chat/ui/widgets/chat/ImageMessage.dart';
import 'package:qurana/features/chat/ui/widgets/chat/textMessage.dart';

class ShowMessage extends StatefulWidget {
  String chatid;
  ChatCubit cubit;
  ShowMessage({super.key, required this.chatid, required this.cubit});

  @override
  State<ShowMessage> createState() => _ShowMessageState();
}

class _ShowMessageState extends State<ShowMessage> {
  @override
  Widget build(BuildContext context) {
    return
        Expanded(
          child:
        Container(
            color: colors.back_background,
            child: StreamBuilder<QuerySnapshot>(
              stream: SingleChatNetwork.getmassages(widget.chatid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: colors.primary),
                  );
                } else {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            size.height(10.h),
                            Row(
                              mainAxisAlignment: snapshot.data!.docs[index]
                                          ['senderid'] ==
                                      widget.cubit.getcurrentUserId()
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                              children: [
                                snapshot.data!.docs[index]['type'] == 'text'
                                    ? TextMessage(
                                        username: snapshot.data!.docs[index]
                                            ['sendername'],
                                        time: snapshot.data!.docs[index]
                                            ['time'],
                                        message: snapshot.data!.docs[index]
                                            ['massage'],
                                        seen: false,
                                        isSender: snapshot.data!.docs[index]
                                                    ['senderid'] ==
                                                widget.cubit.getcurrentUserId()
                                            ? true
                                            : false,
                                      )
                                    : 
                                    snapshot.data!.docs[index]['type'] == 'image'?
                                    ImageMessage(
                                        cubit: widget.cubit,
                                        username: snapshot.data!.docs[index]
                                            ['sendername'],
                                        time: snapshot.data!.docs[index]
                                            ['time'],
                                        messageUrl: snapshot.data!.docs[index]
                                            ['massage'],
                                        seen: false,
                                        isSender: snapshot.data!.docs[index]
                                                    ['senderid'] ==
                                                widget.cubit.getcurrentUserId()
                                            ? true
                                            : false,
                                        isVideo: false,
                                      ):
                                        ImageMessage(
                                            cubit: widget.cubit,
                                            username: snapshot.data!.docs[index]
                                                ['sendername'],
                                            time: snapshot.data!.docs[index]
                                                ['time'],
                                            messageUrl: snapshot
                                                .data!.docs[index]['massage'],
                                            seen: false,
                                            isSender: snapshot.data!.docs[index]
                                                        ['senderid'] ==
                                                    widget.cubit
                                                        .getcurrentUserId()
                                                ? true
                                                : false,
                                            isVideo: true,
                                          )  
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(
                        child: Text(
                      "No Messages yet",
                      style: textstyle.maintitle.copyWith(
                        fontSize: 25,
                      ),
                    ));
                  }
                }
              },
            ))
        )
        ;
  }
}
