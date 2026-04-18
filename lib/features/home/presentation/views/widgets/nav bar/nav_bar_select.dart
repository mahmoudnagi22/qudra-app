import 'package:flutter/material.dart';
import 'package:qodraapp/features/home/domain/entities/nav_bar_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/nav%20bar/active_nav_bar_item.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/nav%20bar/in_active_nav_bar_item.dart';

class NavBarSelect extends StatelessWidget {
  const NavBarSelect(
      {super.key, required this.isSelected, required this.navBarEntity});
  final bool isSelected;
  final NavBarEntity navBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveNavBarIcon(navBarEntity: navBarEntity)
        : InactiveNavBarIcon(navBarEntity: navBarEntity);
  }
}
