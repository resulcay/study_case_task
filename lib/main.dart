import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:study_case_task/utilities/provider/dropdown_menu_item_provider.dart';
import 'package:study_case_task/utilities/provider/exercise_provider.dart';

import 'utilities/provider/is_loading_provider.dart';
import 'view/home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to vertical orientation.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IsLoadingProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
        ChangeNotifierProvider(create: (_) => DropDownMenuItemProvider()),
      ],
      child: MaterialApp(
        title: 'Study Case Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
        },
      ),
    );
  }
}
