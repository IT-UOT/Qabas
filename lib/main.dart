import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/screens/error_screen.dart';
import 'package:itmentor/screens/home_screen.dart';
import 'package:itmentor/services/locator.dart';
import 'blocs/home_screen_bloc/home_screen_cubit.dart';
import 'data/department_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Mentor',
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Alexandria',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6F07D8)),
      ),
      home: BlocProvider(
        // the cubit should be implemented by injectable so it can be general in the app
        create: (_) => HomeScreenCubit(locator<DepartmentRepository>()),

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SafeArea(
              child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (departments) {
                    return HomeScreen(departments: departments);
                    },
                    loading: () => const Center(child:  CircularProgressIndicator()),
                    error: (e) => ErrorScreen(message: e),
                    orElse: () => const ErrorScreen(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
