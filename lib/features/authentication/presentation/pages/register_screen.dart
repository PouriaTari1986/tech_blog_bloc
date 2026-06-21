import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/const.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';
import 'package:tech_bloc/features/authentication/presentation/widgets/buttom_style.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController nameController = TextEditingController();
@override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              size.width / 15,
              size.width / 5,
              size.width / 15,
              size.width / 20,
            ),
            child: Column(
              children: [
                SvgPicture.asset(Assets.images.welcome, height: 100),
                SizedBox(height: size.width / 12),
                RichText(
                  textAlign: .center,
                  text: TextSpan(
                    style: LightTextTheme.welcomeText,
                    text: AppStrings.congtrats,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    controller: nameController,
                    textAlign: .start,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      hintText: AppStrings.nameAndFamily,
                      hintStyle: LightTextTheme.listAuthor,
                    ),
                  ),
                ),
                Text(AppStrings.chooseCat, style: LightTextTheme.welcomeText),
                SizedBox(height: size.width / 35),
                SizedBox(
                  height: size.height / 9,
                  child: GridView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: 6,
                    scrollDirection: .horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.4,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12, bottom: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              colors: GradiantsColors.tags,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: .spaceAround,
                            children: [
                              Assets.images.a1629506.image(scale: 2),
                              Text(
                                "data",
                                style: LightTextTheme.bannerTexrNormal,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SvgPicture.asset(Assets.images.arrow, height: 70),
                SizedBox(
                  height: size.height / 9,
                  child: GridView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: 6,
                    scrollDirection: .horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.4,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                ),
                SizedBox(
                  height: size.width / 8,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: .horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.width / 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: SolidColors.catsColor,
                          ),
                          child: Text(
                            "data",
                            style: LightTextTheme.detailText,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: size.width / 10),
                ElevatedButton(
                  style: buttomStayle(size),
                  onPressed: () {
                    context.pushReplacementNamed(NamedScreen.homeScreenName);
                  },
                  child: Text(AppStrings.continueWay),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
