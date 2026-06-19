
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class MainShell extends StatelessWidget {
   const MainShell({super.key,required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
                appBar: AppBar(
          elevation: 0,
         
          title: Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  SvgPicture.asset(Assets.images.threeLine, height: 25),
                  Assets.images.logo.image(height: size.height / 13.6),
                  SvgPicture.asset(Assets.images.search, height: 25),
                ],
              ),),
              body: Stack(
                children: [
                  child,
                  Positioned(
            bottom: 0,
            right: 0,
            left: 0,
             child: Container(
             padding: EdgeInsets.fromLTRB(30, 30,30, 30),
             height: size.height/7,

              decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradiantsColors.bottomNavTrans,
                begin: .topCenter,
                end: .bottomCenter)
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: GradiantsColors.bottomNav,
                    begin: .topCenter,
                    end: .bottomCenter
                    ),
                ),
                child: Row(
                    mainAxisAlignment: .spaceAround,
                  children: [

                    IconButton(
                      onPressed: () {
                        context.goNamed(NamedScreen.homeScreenName);
                      },
                      icon:  Assets.images.home.image(scale: 2)),

                    IconButton(
                      onPressed: () {
                        context.goNamed(NamedScreen.registerIntoName);
                      },
                      icon: Assets.images.register.image(scale: 2)),

                    IconButton(
                      onPressed: () {
                        context.goNamed(NamedScreen.userScreenName);
                      },
                      
                      icon: Assets.images.user.image(scale: 2)),
                  ],
                ),
              ),
           )
           )
                ],
              ),
    );
  }
}