import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:suit_media_test_app/styles/color_style.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

class AlertDialogWidget {
  static Future<dynamic> successDialog(BuildContext context, String value) =>
      AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              headerAnimationLoop: false,
              animType: AnimType.scale,
              titleTextStyle: TextStyleWidget.h1(),
              title: '$value Adalah Palindrom!',
              btnOkColor: ColorStyle.greenDark,
              btnOkOnPress: () {})
          .show();

  static Future<dynamic> failedDialog(BuildContext context, String value) =>
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              headerAnimationLoop: false,
              animType: AnimType.scale,
              titleTextStyle: TextStyleWidget.h1(),
              title: '$value Bukan Palindrom!',
              btnOkColor: ColorStyle.greenDark,
              btnOkOnPress: () {})
          .show();
}
