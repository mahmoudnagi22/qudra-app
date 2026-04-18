// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('$change');
  }
}
