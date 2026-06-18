

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';
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

    Future.delayed(Duration(seconds: 2),
    (){
      if (mounted) {
        context.pushReplacementNamed(NamedScreen.homeScreenName);
      } 
    }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Assets.images.icon.image(height: 150),
              SizedBox(height: 32,),
              SpinKitFadingCube(
                color: SolidColors.listHeadColor,
                size: 32,)
            ],
          ),
        )
      ),
    );
  }
}