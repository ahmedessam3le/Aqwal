import 'package:aqwal/config/locale/app_localizations.dart';
import 'package:aqwal/core/utils/app_colors.dart';
import 'package:aqwal/core/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const AppErrorWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primaryColor,
            size: 200.r,
          ),
          Text(
            AppLocalizations.of(context)!.translate('something_went_wrong')!,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.hp),
            child: Text(
              AppLocalizations.of(context)!.translate('try_again')!,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.hintColor,
              ),
            ),
          ),
          Container(
            height: 55.hp,
            width: context.width * 0.55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                onPrimary: AppColors.primaryColor,
                elevation: 500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              onPressed: () {
                if (onPress != null) {
                  onPress!();
                }
              },
              child: Text(
                AppLocalizations.of(context)!.translate('reload_screen')!,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
