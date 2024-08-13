import 'package:flutter/material.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';
import 'package:suit_media_test_app/styles/color_style.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(user.avatar), fit: BoxFit.cover),
        ),
      ),
      title: Text(
        '${user.firstName} ${user.lastName}',
        style: TextStyleWidget.h3(),
      ),
      subtitle: Text(
        user.email,
        style: TextStyleWidget.h5(color: ColorStyle.greyDark),
      ),
    );
  }
}
