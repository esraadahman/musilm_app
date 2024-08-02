import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qurana/core/theming/colors.dart';
class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return     Padding(
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
                              borderSide: BorderSide(
                                  color: colors.sub_background, width: 0)),
                        ),
                      ),
                    ),
                  );
  }
}