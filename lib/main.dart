import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/firebase_options.dart';
import 'package:jobs/layout/detail_category/detailCategory.dart';
import 'package:jobs/layout/todo_app/job.dart';
import 'package:jobs/styles/bloc_observ.dart';
import 'package:jobs/widget/category_item.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: HomeLayout()),
      routes: {
        CategoryItem.screenRouter: (context) => AllJobsCategory(),
      },
    );
  }
}

// localizationsDelegates: [
// GlobalMaterialLocalizations.delegate,
// GlobalWidgetsLocalizations.delegate,
// GlobalCupertinoLocalizations.delegate,
// ],
// supportedLocales: [
// Locale('ar', 'AE'), // English, no country code
// //  Locale('en', ''), // Spanish, no country code
// ],
