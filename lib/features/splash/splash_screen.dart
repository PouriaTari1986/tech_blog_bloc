

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}
class _SplashScreenState extends State<SplashScreen>{


  @override
  void initState() {
    
    super.initState();

    Future.delayed(Duration(milliseconds: 500),
    (){
      if (mounted) {
        context.goNamed(NamedScreen.homeScreen);
      } 
    }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.images.icon.image(height: 100),
      )
    );
  }
}