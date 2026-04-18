import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/features/home/presentation/helpers/motivational_message_provider.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoCubit.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoStates.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/rank%20container/rank_container.dart';
import 'package:qodraapp/generated/l10n.dart';

class BlocBuilderRankContainer extends StatefulWidget {
  const BlocBuilderRankContainer({super.key});

  @override
  State<BlocBuilderRankContainer> createState() =>
      _BlocBuilderRankContainerState();
}

class _BlocBuilderRankContainerState extends State<BlocBuilderRankContainer> {
  final MotivationalMessageProvider _messageProvider =
      MotivationalMessageProvider();
  String _message = '';
  String _currentLocaleCode = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final localeCode = Localizations.localeOf(context).languageCode;
    if (_message.isNotEmpty && localeCode == _currentLocaleCode) {
      return;
    }

    final l10n = S.of(context);
    _message = _messageProvider.getRandomMessage(l10n, localeCode: localeCode);
    _currentLocaleCode = localeCode;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, Userinfostates>(
      builder: (context, state) {
        int visits = 0;
        String rankType = S.of(context).levelNormal;
        Color colorRank = AppColors.normalRank;
        String txt = _message;
        String photo = Assets.imagesSilver;
        if (state is UserInfoSucsessState) {
          if (state.userInfoEntity.rank != null) {
            if (state.userInfoEntity.rank! == 0) {
              rankType = S.of(context).levelNormal;
              colorRank = AppColors.normalRank;
              photo = Assets.imagesSilver;
            } else if (state.userInfoEntity.rank! == 1) {
              rankType = S.of(context).levelBronze;
              colorRank = AppColors.bronzeRank;
              photo = Assets.imagesBronze;
            } else if (state.userInfoEntity.rank! == 2) {
              rankType = S.of(context).levelSilver;
              colorRank = AppColors.silverRank;
              photo = Assets.imagesSilver;
            } else if (state.userInfoEntity.rank! == 3) {
              rankType = S.of(context).levelGold;
              colorRank = AppColors.goldRank;
              photo = Assets.imagesGold;
            } else {
              rankType = S.of(context).levelPlatinum;
              colorRank = AppColors.platinumRank;
              photo = Assets.imagesPlatinum;
            }
          }
          visits = state.userInfoEntity.numOfSessions ?? 0;
        }
        return RankContainer(
          visits: visits,
          rankType: rankType,
          colorRank: colorRank,
          txt: txt,
          photo: photo,
          isLoading:
              state is UserInfoLoadingState || state is UserInfoInitialState,
        );
      },
    );
  }
}
