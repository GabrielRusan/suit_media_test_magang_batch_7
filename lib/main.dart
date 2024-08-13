import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suit_media_test_app/constants/routes.dart';
import 'package:suit_media_test_app/injection.dart' as di;
import 'package:suit_media_test_app/presentation/blocs/palindrom_bloc/palindrom_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/selected_user_bloc/selected_user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/username_bloc/username_bloc.dart';
import 'package:suit_media_test_app/presentation/pages/first_page.dart';
import 'package:suit_media_test_app/presentation/pages/second_page.dart';
import 'package:suit_media_test_app/presentation/pages/third_page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserNameBloc>(
          create: (_) => di.locator<UserNameBloc>(),
        ),
        BlocProvider<PalindromBloc>(
          create: (_) => di.locator<PalindromBloc>(),
        ),
        BlocProvider<UserBloc>(
          create: (_) => di.locator<UserBloc>(),
        ),
        BlocProvider<SelectedUserBloc>(
          create: (_) => di.locator<SelectedUserBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Suit Media Intern Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: MyRoutes.firstPage,
        routes: {
          MyRoutes.firstPage: (_) => const FirstPage(),
          MyRoutes.secondPage: (_) => const SecondPage(),
          MyRoutes.thirdPage: (_) => const ThirdPage(),
        },
      ),
    );
  }
}
