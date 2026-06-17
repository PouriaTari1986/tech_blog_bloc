
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:tech_bloc/core/utils/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp.router(

    theme: ThemeData.light(),

      title: 'Localizations Sample App',
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('fa',''), // Farsi
    
  ],


      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
  
}