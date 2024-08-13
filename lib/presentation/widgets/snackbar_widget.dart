import 'package:flutter/material.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

successSnackbar(BuildContext context, String title, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(0),
      elevation: 0,
      margin: const EdgeInsets.only(
        bottom: 30,
        left: 16,
        right: 16,
      ),
      duration: const Duration(seconds: 1, milliseconds: 500),
      content: Container(
        padding: const EdgeInsets.all(8),
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyleWidget.snackbarTitle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  message,
                  style: TextStyleWidget.snackBarMessage(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ))
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
    ),
  );
}
