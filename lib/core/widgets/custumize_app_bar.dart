import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

class CustomizeAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomizeAppbar({
    super.key,
    required this.text,
  });

  final String text;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
    
      title: Row(
        mainAxisAlignment: .spaceAround,
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset(Assets.images.rightArrowSvg)),
    
          Text(text,style: LightTextTheme.listHeadText,)
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize =>Size.fromHeight(kToolbarHeight);
}