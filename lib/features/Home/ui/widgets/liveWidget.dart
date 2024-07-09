import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/features/Home/data/network/models.dart';
import 'package:qurana/features/Home/ui/widgets/home_header.dart';
import 'package:qurana/features/Home/ui/widgets/meni_widget.dart';
import 'package:qurana/features/navi/ui/screens/navi.dart';

class LiveWidget extends StatefulWidget {
  String? image;

  LiveWidget({super.key, required this.image});

  @override
  State<LiveWidget> createState() => _LiveWidgetState();
}

class _LiveWidgetState extends State<LiveWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: AssetImage(widget.image!),
          backgroundColor: colors.background,
        ),
        Positioned(
            right: 5,
            bottom: 40,
            child: Container(
                height: 20.h,
                width: 30.w,
                decoration: BoxDecoration(
                    color: colors.LiveIcon,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Live",
                    style: textstyle.subtitle.copyWith(
                        color: colors.background,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )))
      ],
    );
  }
}
