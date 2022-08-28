import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/screens/change_profile_data_screen.dart';
import 'package:weather_app/presentation/screens/home_screen.dart';
import 'package:weather_app/presentation/screens/login_screen.dart';
import 'package:weather_app/presentation/screens/registration_screen.dart';
import 'package:weather_app/presentation/screens/start_screen.dart';

import 'data/constants/strings.dart';
import 'data/helpers/bloc_observer.dart';
import 'data/helpers/dio.dart';
import 'data/helpers/firebase_options.dart';
import 'data/helpers/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: startScreenRoute,
        builder: BotToastInit(),
        routes: {
          startScreenRoute: (context) => const StartScreen(),
          loginScreenRoute: (context) => LoginScreen(),
          registerScreenRoute: (context) => RegisterScreen(),
          homeScreenRoute: (context) => const HomeScreen(),
          changeProfileDataScreenRoute: (context) => ChangeProfileDataScreen(),
        },
      ),
    );
  }
}
