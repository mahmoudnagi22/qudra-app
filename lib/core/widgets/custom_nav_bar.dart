import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/features/home/domain/entities/nav_bar_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/nav%20bar/nav_bar_select.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar(
      {super.key, required this.changePage, required this.currentIndex});
  final void Function(int) changePage;
  final int currentIndex;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: SafeArea(
        top: false,
        // Keep the full navigation bar above system gesture/3-button areas.
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [AppShadows.dropShadow],
          ),
          child: SizedBox(
            height: 64.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getNavBarItems(context).asMap().entries.map((entry) {
                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      widget.changePage(entry.key);
                    },
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 56.h),
                        child: NavBarSelect(
                          navBarEntity: entry.value,
                          isSelected: widget.currentIndex == entry.key,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
