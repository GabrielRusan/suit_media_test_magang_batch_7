import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:suit_media_test_app/presentation/blocs/selected_user_bloc/selected_user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:suit_media_test_app/presentation/widgets/bottom_loader.dart';
import 'package:suit_media_test_app/presentation/widgets/skeleton_card.dart';
import 'package:suit_media_test_app/presentation/widgets/snackbar_widget.dart';
import 'package:suit_media_test_app/presentation/widgets/user_card.dart';
import 'package:suit_media_test_app/styles/color_style.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Third Screen',
          style: TextStyleWidget.h2(),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UserBloc>().add(FetchUsers());
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 32, bottom: 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              switch (state.status) {
                case UserStatus.failure:
                  return const Center(child: Text('failed to fetch users'));
                case UserStatus.success:
                  if (state.users.isEmpty) {
                    return const Center(child: Text('no users'));
                  }
                  return ListView.separated(
                    controller: _scrollController,
                    separatorBuilder: (context, index) => const Divider(
                      color: ColorStyle.border,
                      thickness: 0.5,
                    ),
                    itemBuilder: (context, index) => index >= state.users.length
                        ? const BottomLoader()
                        : GestureDetector(
                            onTap: () {
                              context.read<SelectedUserBloc>().add(
                                  SelectedUserEvent(user: state.users[index]));
                              successSnackbar(context, 'Sukses Memiliih User!',
                                  '${state.users[index].firstName} ${state.users[index].lastName} dipilih');
                            },
                            child: UserCard(user: state.users[index])),
                    itemCount: state.hasReachedMax
                        ? state.users.length
                        : state.users.length + 1,
                  );
                case UserStatus.initial:
                  return Skeletonizer(
                      enabled: true,
                      // ignoreContainers: true,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemBuilder: (context, index) => const SkeletonCard(),
                        itemCount: 9,
                      ));
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<UserBloc>().add(FetchUsers());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
