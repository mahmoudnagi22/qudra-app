import 'dart:math';

import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/generated/l10n.dart';

class MotivationalMessageProvider {
  MotivationalMessageProvider({Random? random}) : _random = random ?? Random();

  final Random _random;

  List<String> getMessages(S l10n) {
    return List<String>.generate(
      _messagesCount,
      (index) => _messageByIndex(l10n, index),
      growable: false,
    );
  }

  String getRandomMessage(S l10n, {required String localeCode}) {
    final messages = getMessages(l10n);
    if (messages.isEmpty) {
      return '';
    }

    final storageKey = '${lastMotivationalMessageIndexKey}_$localeCode';
    final lastIndex = int.tryParse(SharedPrefs.getString(storageKey));
    final nextIndex = _nextRandomIndex(
      max: messages.length,
      previousIndex: lastIndex,
    );

    SharedPrefs.setString(storageKey, nextIndex.toString());
    return messages[nextIndex];
  }

  int _nextRandomIndex({required int max, int? previousIndex}) {
    if (max <= 1) {
      return 0;
    }

    var nextIndex = _random.nextInt(max);
    if (previousIndex == null || previousIndex < 0 || previousIndex >= max) {
      return nextIndex;
    }

    while (nextIndex == previousIndex) {
      nextIndex = _random.nextInt(max);
    }
    return nextIndex;
  }

  String _messageByIndex(S l10n, int index) {
    switch (index) {
      case 0:
        return l10n.motivationalMessage_001;
      case 1:
        return l10n.motivationalMessage_002;
      case 2:
        return l10n.motivationalMessage_003;
      case 3:
        return l10n.motivationalMessage_004;
      case 4:
        return l10n.motivationalMessage_005;
      case 5:
        return l10n.motivationalMessage_006;
      case 6:
        return l10n.motivationalMessage_007;
      case 7:
        return l10n.motivationalMessage_008;
      case 8:
        return l10n.motivationalMessage_009;
      case 9:
        return l10n.motivationalMessage_010;
      case 10:
        return l10n.motivationalMessage_011;
      case 11:
        return l10n.motivationalMessage_012;
      case 12:
        return l10n.motivationalMessage_013;
      case 13:
        return l10n.motivationalMessage_014;
      case 14:
        return l10n.motivationalMessage_015;
      case 15:
        return l10n.motivationalMessage_016;
      case 16:
        return l10n.motivationalMessage_017;
      case 17:
        return l10n.motivationalMessage_018;
      case 18:
        return l10n.motivationalMessage_019;
      case 19:
        return l10n.motivationalMessage_020;
      case 20:
        return l10n.motivationalMessage_021;
      case 21:
        return l10n.motivationalMessage_022;
      case 22:
        return l10n.motivationalMessage_023;
      case 23:
        return l10n.motivationalMessage_024;
      case 24:
        return l10n.motivationalMessage_025;
      case 25:
        return l10n.motivationalMessage_026;
      case 26:
        return l10n.motivationalMessage_027;
      case 27:
        return l10n.motivationalMessage_028;
      case 28:
        return l10n.motivationalMessage_029;
      case 29:
        return l10n.motivationalMessage_030;
      case 30:
        return l10n.motivationalMessage_031;
      case 31:
        return l10n.motivationalMessage_032;
      case 32:
        return l10n.motivationalMessage_033;
      case 33:
        return l10n.motivationalMessage_034;
      case 34:
        return l10n.motivationalMessage_035;
      case 35:
        return l10n.motivationalMessage_036;
      case 36:
        return l10n.motivationalMessage_037;
      case 37:
        return l10n.motivationalMessage_038;
      case 38:
        return l10n.motivationalMessage_039;
      case 39:
        return l10n.motivationalMessage_040;
      case 40:
        return l10n.motivationalMessage_041;
      case 41:
        return l10n.motivationalMessage_042;
      case 42:
        return l10n.motivationalMessage_043;
      case 43:
        return l10n.motivationalMessage_044;
      case 44:
        return l10n.motivationalMessage_045;
      case 45:
        return l10n.motivationalMessage_046;
      case 46:
        return l10n.motivationalMessage_047;
      case 47:
        return l10n.motivationalMessage_048;
      case 48:
        return l10n.motivationalMessage_049;
      case 49:
        return l10n.motivationalMessage_050;
      default:
        return l10n.motivationalMessage_001;
    }
  }
}

const int _messagesCount = 50;
