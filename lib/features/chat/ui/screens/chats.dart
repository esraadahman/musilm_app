import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/routing/router.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/features/chat/ui/screens/SingleChat.dart';
import 'package:qurana/features/chat/ui/widgets/chats/IconRow.dart';
import 'package:qurana/features/chat/ui/widgets/chatHead.dart';
import 'package:qurana/features/chat/ui/widgets/chats/liveUsers.dart';
import 'package:qurana/features/chat/ui/widgets/chats/usersSends.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  bool G_S = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.back_background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            size.height(40),
            ChatHeader(
              text: 'Chats',
            ),
            size.height(10),
            Container(
              height: 100.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LiveUsers(image: "images/Rectangle5.png"));
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
              child: Container(
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    //cubit.searchbyname(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colors.background,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: colors.sub_background, width: 0)),
                  ),
                ),
              ),
            ),
            size.height(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //  size.width(20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      G_S = false;
                    });
                  },
                  child: IconsRow(
                    text: 'Chat 1-1',
                    icon: CupertinoIcons.chat_bubble_2_fill,
                    G_S: !G_S,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      G_S = true;
                    });
                  },
                  child: IconsRow(
                    text: 'Chat Group',
                    icon: CupertinoIcons.group_solid,
                    G_S: G_S,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.35,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: GestureDetector(
                          onTap: () {
                            context.navigateTo(SingleChat(imgPath: '', userName: ''));
                          },
                          child: UsersSends(
                            imgPath: '',
                            userName: '',
                            message: '',
                          )));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: colors.subtext,
                      thickness: 2.0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
