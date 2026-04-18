import 'package:flutter/material.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/details_text.dart';

class DetailsAndOpeninigOfWorkshop extends StatelessWidget {
  const DetailsAndOpeninigOfWorkshop({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return DetalisText(onTap: onTap);
  }
}
