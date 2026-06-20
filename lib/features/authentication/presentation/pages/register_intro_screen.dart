


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_bloc/core/utils/const.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(

      body: Column(
        children: [
          SizedBox(height: size.width/3,),
          Center(child: SvgPicture.asset(Assets.images.welcome,height: 150,),),
          SizedBox(height: size.width/10,),
          RichText(
            textAlign: .center,
            text: 
          
          TextSpan(
            style: LightTextTheme.welcomeText,
            text: AppStrings.welcome)),

            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll<OutlinedBorder>(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18))),
                backgroundColor: WidgetStateColor.resolveWith((callback){
                  if (callback.contains(WidgetState.pressed)) {
                    return SolidColors.blueColor;
                  } else {
                    return SolidColors.listHeadColor;
                  }
                }),
                foregroundColor: WidgetStatePropertyAll<Color>(SolidColors.banerBoldText),
                textStyle: WidgetStateTextStyle.resolveWith((value){
                  if (value.contains(WidgetState.pressed)) {
                    return LightTextTheme.elevatedTextOnPressed;
                  } else {
                    return LightTextTheme.elevatedText;
                  }
                }),
                minimumSize: WidgetStatePropertyAll<Size>(
                  Size(size.width/1.1, size.width/8))
              ),
              onPressed: () {
                
              }, child: Text(AppStrings.letsGo)),
              SizedBox(height:size.width/15 )
        ],

      ),
    ));
  }
}