import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/const.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/routes/route_names.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/register/registe_cubit.dart';
import 'package:tech_bloc/features/authentication/presentation/bloc/cubit/verify_code/verify_code_cubit.dart';
import 'package:tech_bloc/features/authentication/presentation/widgets/buttom_style.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:validators/validators.dart';

class RegisterIntroScreen extends StatefulWidget {
  const RegisterIntroScreen({super.key});

  @override
  State<RegisterIntroScreen> createState() => _RegisterIntroScreenState();
}

class _RegisterIntroScreenState extends State<RegisterIntroScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController codeController = TextEditingController();
  @override
  void dispose() {
   emailController.dispose();
   codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              context.pop();
              _showVerifyCodeBottomSheet(
                context, 
                size, 
                state.email.userId, 
                
                emailController.text);
            }
            if (state is RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error.toString())));
            }
          },
          
        ),
        BlocListener<VerifyCodeCubit,VerifyCodeState>
        (listener: (context, state) {
          if (state is VerifyCodeSuccess) {
            context.pop();
            context.goNamed(NamedScreen.registerScreenName,
            extra: state.result
            );
          }if (state is VerifyCodeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)));
          }
        },)
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Scaffold(
            body: Container(
              width: size.width,
              color: Colors.white ,
              child: Column(
                children: [
                  SizedBox(height: size.width / 3),
                  Center(
                    child: SvgPicture.asset(Assets.images.welcome, height: 150),
                  ),
                  SizedBox(height: size.width / 10),
                  RichText(
                    textAlign: .center,
                    text: TextSpan(
                      style: LightTextTheme.welcomeText,
                      text: AppStrings.welcome,
                    ),
                  ),
              
                  SizedBox(height: size.width / 5),
                  ElevatedButton(
                    style: buttomStayle(size),
                    onPressed: () {
                      _showEmailBottomSheet(context, size);
                    },
                    child: Text(AppStrings.letsGo),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(AppStrings.enterEmail, style: LightTextTheme.welcomeText),

                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextField(
                    textAlign: .center,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "test@test.com",
                      hintStyle: LightTextTheme.listAuthor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: buttomStayle(size),
                      onPressed: 
                        state is RegisterLoading ?
                         null :
                         (){
                        
                         
                          if(!isEmail(emailController.text.trim())){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("ایمیل معتبر نیست"),),);
                              return;
                          }
                      context.read<RegisterCubit>().register(
                        emailController.text.trim());
                         
                      },
                      child:state is RegisterLoading? 
                      const CircularProgressIndicator():
                      Text(AppStrings.continueWay),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
 
  Future<dynamic> _showVerifyCodeBottomSheet(

    BuildContext context,
    Size size,
    String userId,
    String email,
   
  ) {

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(AppStrings.enterCode, style: LightTextTheme.welcomeText),
        
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextField(
                    keyboardType: .number,
                    textAlign: .center,
                    controller: codeController,
                    decoration: InputDecoration(
                      hintText: "test@test.com",
                      hintStyle: LightTextTheme.listAuthor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: buttomStayle(size),
                      onPressed: 
                        state is VerifyCodeLoading
                            ? null
                            : () {
                                context.read<VerifyCodeCubit>().verify(
                                  email: email,
                                  userId: userId,
                                  code: codeController.text,
                                );
                              
                      },
                      child: state is VerifyCodeLoading
                          ? const CircularProgressIndicator()
                          : Text(AppStrings.continueWay),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
