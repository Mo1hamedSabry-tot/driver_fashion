import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc_observer.dart';

import 'app/app.dart';
import 'app/core/utils/theming/app_colors.dart';
import 'injection_container.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MainApp());
}
