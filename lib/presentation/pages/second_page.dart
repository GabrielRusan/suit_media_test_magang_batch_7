import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suit_media_test_app/constants/routes.dart';
import 'package:suit_media_test_app/presentation/blocs/selected_user_bloc/selected_user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/username_bloc/username_bloc.dart';
import 'package:suit_media_test_app/presentation/widgets/button_widget.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
          color: Colors.deepPurple,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.grey.withOpacity(0.2),
        title: Text(
          'Second Screen',
          style: TextStyleWidget.h2(),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyleWidget.h4(),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    BlocBuilder<UserNameBloc, UserNameState>(
                      builder: (context, state) {
                        return Text(
                          state.username,
                          style: TextStyleWidget.h2(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: Center(
                  child: BlocBuilder<SelectedUserBloc, SelectedUserState>(
                builder: (context, state) {
                  return Text(
                    '${state.user.firstName} ${state.user.lastName}',
                    style: TextStyleWidget.h1(),
                  );
                },
              )),
            ),
            ButtonWidget.defaultContainer(
                width: double.infinity,
                child: Text(
                  'Choose a User',
                  style: TextStyleWidget.btn(),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(MyRoutes.thirdPage);
                  context.read<UserBloc>().add(FetchUsers());
                }),
          ],
        ),
      ),
    );
  }
}
