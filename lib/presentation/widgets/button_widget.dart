import 'package:flutter/material.dart';
import 'package:suit_media_test_app/styles/color_style.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

class ButtonWidget {
  static Widget defaultContainer(
      {required Widget? child,
      required Function()? onPressed,
      double? width,
      TextStyle? textstyle}) {
    return SizedBox(
      height: 41,
      width: width ?? 310,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: onPressed == null
                ? null
                : WidgetStateProperty.all(ColorStyle.greenDark),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return ColorStyle.greenDark.withOpacity(0.2);
                }
                return null;
              },
            ),
          ),
          onPressed: onPressed,
          child: child ??
              Text(
                'Button',
                style: textstyle ??
                    TextStyleWidget.btn(
                      color: onPressed == null ? Colors.grey : Colors.white,
                    ),
              )),
    );
  }
}
