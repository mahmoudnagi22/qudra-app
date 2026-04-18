import 'package:flutter/widgets.dart';

class LocalizationType {}

class LoadingLocalization extends LocalizationType {}

class LoadedLocalization extends LocalizationType {
  final Locale locale;
  LoadedLocalization({required this.locale});
}
