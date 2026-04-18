import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/generated/l10n.dart';

class SkipText extends StatelessWidget {
  const SkipText({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        S.of(context).skip,
        style: AppTextStyles.text16Medium,
      ),
    );
  }
}
