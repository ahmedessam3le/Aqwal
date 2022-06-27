import 'package:aqwal/config/locale/app_localizations.dart';
import 'package:aqwal/core/utils/app_colors.dart';
import 'package:aqwal/core/utils/app_responsive.dart';
import 'package:aqwal/core/widgets/app_error_widget.dart';
import 'package:aqwal/features/random_quote/presentation/cubits/random_quote_cubit.dart';
import 'package:aqwal/features/random_quote/presentation/widgets/quote_item.dart';
import 'package:aqwal/features/splash/presentation/cubits/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() {
    BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  }

  @override
  void initState() {
    super.initState();

    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(AppLocalizations.of(context)!.translate('app_name')!),
      actions: [
        IconButton(
          onPressed: () {
            if (AppLocalizations.of(context)!.isEnLocale) {
              BlocProvider.of<LocaleCubit>(context).toArabic();
            } else {
              BlocProvider.of<LocaleCubit>(context).toEnglish();
            }
          },
          icon: Icon(
            Icons.translate_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return Scaffold(
            appBar: appBar,
            body: Center(
              child: SpinKitFadingCircle(
                color: AppColors.primaryColor,
              ),
            ),
          );
        } else if (state is RandomQuoteError) {
          return Scaffold(
            appBar: appBar,
            body: AppErrorWidget(
              onPress: _getRandomQuote,
            ),
          );
        } else if (state is RandomQuoteLoaded) {
          return Scaffold(
            appBar: appBar,
            body: QuoteItem(quote: state.quote),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: _getRandomQuote,
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 30.r,
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: appBar,
            body: Center(
              child: SpinKitFadingCircle(
                color: AppColors.primaryColor,
              ),
            ),
          );
        }
      },
    );
  }
}
