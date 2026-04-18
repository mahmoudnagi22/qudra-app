import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/cubits/localization_cubit/localization_cubit_states.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/constants.dart';

class LocalizationCubit extends Cubit<LocalizationType> {
  LocalizationCubit()
      : super(LoadedLocalization(
            locale: SharedPrefs.getString(selectedLanguageType).isNotEmpty
                ? Locale(SharedPrefs.getString(selectedLanguageType))
                : Locale(PlatformDispatcher.instance.locale.languageCode)));
  void changeLan(Locale locale) async {
    emit(LoadingLocalization());
    await Future.delayed(const Duration(milliseconds: 300));
    emit(LoadedLocalization(locale: locale));
  }
}
