import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suit_media_test_app/constants/assets.dart';
import 'package:suit_media_test_app/constants/routes.dart';
import 'package:suit_media_test_app/presentation/blocs/palindrom_bloc/palindrom_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/username_bloc/username_bloc.dart';
import 'package:suit_media_test_app/presentation/widgets/alert_dialog_widget.dart';
import 'package:suit_media_test_app/presentation/widgets/button_widget.dart';
import 'package:suit_media_test_app/presentation/widgets/text_field_widget.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PalindromBloc, PalindromState>(
      listener: (context, state) {
        if (state.palindromStatus == PalindromStatus.yes) {
          AlertDialogWidget.successDialog(context, state.value);
        } else if (state.palindromStatus == PalindromStatus.no) {
          AlertDialogWidget.failedDialog(context, state.value);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.assetsImagesBackground1,
                      ),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  Image.asset(
                    Assets.assetsImagesPhoto1,
                  ),
                  const SizedBox(
                    height: 51,
                  ),
                  TextFieldWidget(
                      hintText: 'Name',
                      onChange: (value) {
                        context
                            .read<UserNameBloc>()
                            .add(OnChangedUserName(value: value));
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                      hintText: 'Palindrom',
                      onChange: (value) {
                        context
                            .read<PalindromBloc>()
                            .add(OnChangedPalindrom(value: value));
                      }),
                  const SizedBox(
                    height: 45,
                  ),
                  ButtonWidget.defaultContainer(
                      width: double.infinity,
                      child: Text(
                        'CHECK',
                        style: TextStyleWidget.btn(),
                      ),
                      onPressed: () {
                        context.read<PalindromBloc>().add(CheckPalindrom());
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  ButtonWidget.defaultContainer(
                      width: double.infinity,
                      child: Text(
                        'NEXT',
                        style: TextStyleWidget.btn(),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyRoutes.secondPage);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
