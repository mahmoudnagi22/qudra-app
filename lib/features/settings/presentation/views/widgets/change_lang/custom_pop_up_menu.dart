import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/cubits/localization_cubit/localization_cubit.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/change_lang/first_item_menu.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/change_lang/second_item_menu.dart';

class CustomPopUpMenu extends StatefulWidget {
  const CustomPopUpMenu({super.key});

  @override
  State<CustomPopUpMenu> createState() => _CustomPopUpMenuState();
}

class _CustomPopUpMenuState extends State<CustomPopUpMenu> {
  bool isSelected = false;
  late String selectedLangType;

  @override
  void initState() {
    selectedLangType = SharedPrefs.getString(selectedLanguageType);
    if (selectedLangType.isEmpty) {
      selectedLangType = 'ar';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isArabicSelected = selectedLangType == 'ar';
    final primaryLangText = isArabicSelected ? 'العربية' : 'English';
    final secondaryLangText = isArabicSelected ? 'English' : 'العربية';

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [AppShadows.dropShadow],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.r),
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: IntrinsicWidth(
              child: Column(
                children: [
                  FirstItemMenu(
                    lang: primaryLangText,
                  ),
                  Visibility(
                    visible: isSelected,
                    maintainAnimation: true,
                    maintainState: true,
                    child: SecondItemMenu(
                      lang: secondaryLangText,
                      onTap: () {
                        final nextType = isArabicSelected ? 'en' : 'ar';
                        changeLang(type: nextType);
                        setState(() {
                          selectedLangType = nextType;
                          isSelected = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeLang({required String type}) {
    SharedPrefs.setString(selectedLanguageType, type);
    BlocProvider.of<LocalizationCubit>(context).changeLan(Locale(type));
  }
}
