import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoCubit.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoStates.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/custom_home_bar.dart';
import 'package:qodraapp/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BlocBuilderCustomAppBar extends StatelessWidget {
  const BlocBuilderCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child:
      BlocBuilder<UserInfoCubit, Userinfostates>(builder: (context, state) {
      UserInfoEntity userInfoEntity = UserInfoEntity(name: '' , rank: 0, numOfSessions: 0);
      bool enabled = false;
      if (state is UserInfoSucsessState) {
        userInfoEntity = state.userInfoEntity;
      } else if (state is UserInfoLoadingState || state is UserInfoInitialState) {
        enabled = true;
      }
      return Skeletonizer(
        enabled: enabled,
        child: CustomHomebar(
          txt: S.of(context).welcomeHomeAppBar(userInfoEntity.name),
        ),
      );
    }));
  }
}
