import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:qodraapp/core/cubits/localization_cubit/localization_cubit.dart';
import 'package:qodraapp/core/cubits/localization_cubit/localization_cubit_states.dart';
import 'package:qodraapp/core/functions/show_warning_dialog.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/rank%20container/bloc_builder_rank_container.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/app_rights_and_version.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/lang_and_addtional_settings_container.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/support_center_section.dart';
import 'package:qodraapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationType>(
      builder: (context, state) {
        bool iSLoading = false;
        if (state is LoadingLocalization) {
          iSLoading = true;
        } else {
          iSLoading = false;
        }
        return Skeletonizer(
          enabled: iSLoading,
          ignorePointers: true,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SafeArea(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: const BlocBuilderRankContainer(),
                )),
              ),
              const SliverToBoxAdapter(
                child: SupportCenterSection(),
              ),
              const SliverToBoxAdapter(
                child: LangAndAddetionalSettingsContainer(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: edgeInsets,
                  child: CustomTextButton(
                    text: S.of(context).logout,
                    onPressed: () {
                      logout(context);
                    },
                    isOutlined: true,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32.h,
                ),
              ),
              const AppRightsVersion(
                version: '1.0.0',
              ),
            ],
          ),
        );
      },
    );
  }

  //-----------------------------------
  void logout(BuildContext context) {
    var userBox = Hive.box<UserInfoEntity>(userInfoDataKeyBox);
    var carBox = Hive.box<CarsInfoEntity>(carsInfoDataBox);
    showLogoutWarningDialog(
      context,
      reject: () {
        Navigator.pop(context);
      },
      accept: () {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.signInScreen, (routes) => false);
        userBox.clear();
        carBox.clear();
        SharedPrefs.setBool(isLoggedInKey, false);
      },
      txt: S.of(context).logout_confirm,
    );
  }
}
