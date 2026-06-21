import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tech_bloc/core/utils/routes/routes.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/register/registe_cubit.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/verify_code/verify_code_cubit.dart';
import 'package:tech_bloc/features/home/presentation/home_bloc/bloc/bloc/home_bloc.dart';
import 'package:tech_bloc/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarBrightness: .light),
  );
  runApp(
    BlocProvider(
      create: (context) => locator<HomeBloc>(),

      child: MultiBlocProvider(
       
         providers: [
          BlocProvider(create: (context) => locator<RegisterCubit>(),),
          BlocProvider(create: (context) => locator<VerifyCodeCubit>(),)
         ],
        child: MaterialApp.router(
          theme: ThemeData.light(useMaterial3: true),

          title: 'Localizations Sample App',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('fa', ''), // Farsi
          ],

          debugShowCheckedModeBanner: false,

          routerConfig: routes,
        ),
      ),
    ),
  );
}
