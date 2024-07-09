import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/routing/router.dart';
import 'package:qurana/core/theming/colors.dart';
import 'package:qurana/core/theming/size.dart';
import 'package:qurana/core/theming/style.dart';
import 'package:qurana/features/muslim_features/muslim_features/cubit/cubit/muslim_cubit.dart';
import 'package:qurana/features/muslim_features/muslim_features/data/model/quran_model.dart';
import 'package:qurana/features/muslim_features/muslim_features/ui/widgets/appbarWidget.dart';
import 'package:qurana/features/muslim_features/muslim_features/ui/widgets/quran_widget.dart';

class Sourah extends StatefulWidget {
  int? id;
  Sourah({super.key, required this.id});

  @override
  State<Sourah> createState() => _SourahState();
}

class _SourahState extends State<Sourah> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MuslimCubit()..getSurah(widget.id!, ""),
        child:
            BlocConsumer<MuslimCubit, MuslimState>(listener: (context, state) {
          // TODO: implement listener
        }, builder: (context, state) {
          final cubit = BlocProvider.of<MuslimCubit>(context);

          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  Container(
                      height: 0.4.sp,
                      color: colors.primary,
                      child: Center(
                        child: Text(
                          "Surah",
                          style: textstyle.maintitle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      )),
                  Expanded(
                      child: ListView.builder(
                          itemCount: cubit.surah.length,
                          itemBuilder: ((context, index) {
                            return ListTile(
                              
                              title: Text(cubit.surah[index]['text']+
                              "\u06DD"+cubit.convertNumberToArabic(cubit.surah[index]['number'].toString()),
                              textDirection: TextDirection.rtl,
                              ),
                            );
                          })))
                ],
              ),
            ),
          );
        }));
  }
}
