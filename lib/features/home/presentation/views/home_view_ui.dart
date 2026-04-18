import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qodraapp/core/widgets/custom_nav_bar.dart';
import 'package:qodraapp/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:qodraapp/features/notifications/presentation/views/widgets/bloc_builder_notification.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/settings_view_body.dart';
class HomeViewUi extends StatefulWidget {
  const HomeViewUi({super.key});

  @override
  State<HomeViewUi> createState() => HomeViewUiState();
}

class HomeViewUiState extends State<HomeViewUi> {
  final List<Widget> screenPage = const [
    HomeViewBody(),
    NotificationViewBody(),
    ChatBotView(),
    SettingsViewBody(),
  ]; // settings / notifications / chatbot
  int isSelected = 0;
    Future<bool> navLogic() async {
    if (isSelected == 0) {
      SystemNavigator.pop();
    } else {
      isSelected = 0;
      setState(() {});
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return  WillPopScope(
        onWillPop: navLogic,
        child: Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: IndexedStack(
              key: ValueKey(isSelected),
              index: isSelected,
              children: screenPage,
            ),
          ),
          bottomNavigationBar: CustomNavBar(
            currentIndex: isSelected,
            changePage: (idx) {
              isSelected = idx;
              setState(() {});
            },
          ),
        ),
      );
  }
  //------------------------------------
  void setPage(int index) {
  isSelected = index;
  setState(() {});
}
}