import 'package:aqwal/config/locale/app_localizations_setup.dart';
import 'package:aqwal/config/routes/app_routes.dart';
import 'package:aqwal/config/themes/app_theme.dart';
import 'package:aqwal/core/utils/app_strings.dart';
import 'package:aqwal/features/splash/presentation/cubits/locale_cubit.dart';
import 'package:aqwal/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AqwalApp extends StatelessWidget {
  const AqwalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.serviceLocator<LocaleCubit>()..getSavedLanguage(),
        ),
      ],
      child: BlocConsumer<LocaleCubit, LocaleStates>(
        listener: (context, state) {},
        // buildWhen: (previousState, currentState) {
        //   return previousState != currentState;
        // },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeListResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            locale: state.locale,
          );
        },
      ),
    );
  }
}
