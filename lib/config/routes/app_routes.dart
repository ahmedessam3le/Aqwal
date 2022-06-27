import 'package:aqwal/core/utils/app_strings.dart';
import 'package:aqwal/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:aqwal/features/splash/presentation/screens/splash_screen.dart';
import 'package:aqwal/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/random_quote/presentation/cubits/random_quote_cubit.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

      case Routes.randomQuoteRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) {
              return di.serviceLocator<RandomQuoteCubit>();
            },
            child: QuoteScreen(),
          ),
        );

      // case Routes.favoriteQuotesRoute:
      //   return MaterialPageRoute(builder: (context) => FavoriteQuotesScreen());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
