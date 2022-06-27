import 'package:aqwal/core/utils/app_colors.dart';
import 'package:aqwal/core/utils/app_responsive.dart';
import 'package:aqwal/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: AppColors.primarySwatch,
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.blue.shade200,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white, size: 30.r),
    ),
  );
}
