




import 'package:flutter/material.dart';
import 'package:tech_bloc/core/networks/shared_prefrenes.dart';
import 'package:tech_bloc/core/utils/const.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class UserScreen extends StatelessWidget {
    UserScreen({super.key});


  final  Future<String?> name = SharedPrefManager.getName();
  final  Future<String?> email = SharedPrefManager.getEmail();

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        
        mainAxisAlignment: .start,
        children: [
          SizedBox(height: size.width/10,),
          Container(
            height: size.width/3,
            decoration: BoxDecoration(
              shape: .circle,
      
            ),
        
              
          ),
          SizedBox(height: size.width/18,),
          InkWell(
            onTap: () {
              
            },
            child: Row(
                mainAxisAlignment: .center,
              children: [
            
                Assets.images.write.image(scale: 2),
                SizedBox(width: 10,),
                Text(AppStrings.editProfilePic,style: LightTextTheme.blueText.copyWith(fontSize: 13),)
              ],
            ),
          ),
          SizedBox(height: size.width/18,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width/4),
            
          ), 
          Text(name.toString(),style: LightTextTheme.detailText,), 
          SizedBox(height: 5,),
          Text(email.toString(),style: LightTextTheme.detailText,),
            
      
          Divider(
              indent: size.width/8,
              endIndent: size.width/8,
              thickness: 1.5,
              color: SolidColors.dividerColor,
          ),
          InkWell(
            onTap: () {
              
            },
            splashColor: SolidColors.listHeadColor,
             
             child: SizedBox(
              height: 45,
              child: Center(child: Text(AppStrings.myFavArticles,style: LightTextTheme.userText,))),
          ),
           Divider(
              indent: size.width/8,
              endIndent: size.width/8,
              thickness: 1.5,
              color: SolidColors.dividerColor,
               
           ),
          InkWell(
            onTap: () {
              
            },
            splashColor: SolidColors.listHeadColor,
             
             child: SizedBox(
              height: 45,
              child: Center(child: Text(AppStrings.myFavPodcastas,style: LightTextTheme.userText,))),
          ),
           Divider(
              indent: size.width/8,
              endIndent: size.width/8,
              thickness: 1.5,
              color: SolidColors.dividerColor,
           ),
          InkWell(
            onTap: () {
              
            },
            splashColor: SolidColors.listHeadColor,
            
             child: SizedBox(
              height: 45,
              child: Center(child: Text(AppStrings.logOutText,style: LightTextTheme.userText,))),
          ),
        ],
      ),
    );
  }
}