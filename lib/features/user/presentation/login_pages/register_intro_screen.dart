


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_bloc/core/utils/const.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/features/user/presentation/login_pages/widgets/buttom_style.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class RegisterItroScreen extends StatelessWidget {
   const RegisterItroScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: 
    Scaffold(
      
      body: Center(
        child: Column(
          
          children: [
            SizedBox(height: size.height/5,),
            SvgPicture.asset(Assets.images.welcome,height: size.width/3,),
            SizedBox(height: size.width/10,),
            RichText(
              textAlign: .center,
              text: TextSpan(
                
                text: AppStrings.welcome,
                style: LightTextTheme.welcomeText
              ),),
              const Spacer(),
              ElevatedButton(
                
                style: buttomStayle(size),
                onPressed: () {
                  
                }, 
                child: Text(AppStrings.letsGo))
          ],
        ),
      ),
    ),);
  }


}