  import 'package:flutter/material.dart';
import 'package:tech_bloc/core/utils/light_text_theme.dart';
import 'package:tech_bloc/core/utils/solid_colors.dart';

ButtonStyle buttomStayle(Size size) {
    return ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(SolidColors.banerBoldText),
                minimumSize: WidgetStatePropertyAll<Size>(.new(size.width/1.1, size.width/10)),
                shape: WidgetStatePropertyAll<OutlinedBorder?>(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(17))),
                textStyle: WidgetStateTextStyle.resolveWith((value){
                  if (value.contains(WidgetState.pressed)) {
                    return LightTextTheme.elevatedTextOnPressed;
                  } else {
                    return LightTextTheme.elevatedText;
                  }
                }
                ),
                backgroundColor: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return SolidColors.blueColor;
                  } else {
                    return SolidColors.listHeadColor;
                  }
                },),
              );
  }