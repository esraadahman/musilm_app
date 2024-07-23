import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/features/Home/data/network/models.dart';
import 'package:qurana/features/Home/ui/widgets/home_header.dart';
import 'package:qurana/features/Home/ui/widgets/meni_widget.dart';
import 'package:qurana/features/navi/ui/screens/navi.dart';

class LiveUsers extends StatefulWidget {
  String? image;

  LiveUsers({super.key, required this.image});

  @override
  State<LiveUsers> createState() => _LiveWidgetState();
}

class _LiveWidgetState extends State<LiveUsers> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage: AssetImage(widget.image!),
          backgroundColor: colors.background,
        ),
      Positioned(
          right: 0,
          //left: 0,
          bottom: 20,
        child: CircleAvatar(
          backgroundColor: colors.primary,
          radius: 10.r,
          
        ),
      ),
      
      ],
    );
  }
}
