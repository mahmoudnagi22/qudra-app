import 'package:flutter/cupertino.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Text(
        title,
        style: AppTextStyles.text14Medium,
      ),
    );
  }
}
