import 'package:flutter/material.dart';
import 'package:suit_media_test_app/styles/color_style.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onChange;
  const TextFieldWidget(
      {super.key, required this.hintText, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: TextField(
        style: TextStyleWidget.h3(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 8, left: 20, right: 20),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyleWidget.h3(color: ColorStyle.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
