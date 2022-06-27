import 'package:aqwal/core/utils/app_colors.dart';
import 'package:aqwal/core/utils/app_responsive.dart';
import 'package:aqwal/features/random_quote/domain/entities/quote.dart';
import 'package:flutter/material.dart';

class QuoteItem extends StatelessWidget {
  final Quote quote;
  const QuoteItem({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.hp),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '\"${quote.content}\"',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              height: 1.3.hp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30.hp),
          Text(
            quote.author,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              height: 1.3.hp,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
