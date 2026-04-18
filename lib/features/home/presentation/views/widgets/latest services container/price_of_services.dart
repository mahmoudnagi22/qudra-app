import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class PriceOfService extends StatelessWidget {
  const PriceOfService({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            price,
            style: AppTextStyles.text16Medium,
          ),
        ],
      ),
    );
  }
}
