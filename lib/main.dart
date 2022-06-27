import 'package:aqwal/app.dart';
import 'package:aqwal/bloc_observer.dart';
import 'package:aqwal/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  BlocOverrides.runZoned(
    () {
      runApp(const AqwalApp());
    },
    blocObserver: AppBlocObserver(),
  );
}
