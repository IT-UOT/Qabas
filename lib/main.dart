import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:itmentor/blocs/home_screen_bloc/home_screen_cubit.dart';

import 'package:itmentor/screens/home_screen.dart';
import 'package:itmentor/services/locator.dart';
import 'package:itmentor/utilities/consts.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //statusBarColor: Colors.w, // set color here
    systemNavigationBarColor: Colors.white,
  ));

  //HydratedBloc.storage = await HydratedStorage.build(storageDirectory:  await getApplicationDocumentsDirectory());
 //locator<HomeScreenCubit>().hydrate();
  Bloc.observer = Observer();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Mentor',
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: Consts.lightTheme,
      darkTheme: Consts.darkTheme,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
