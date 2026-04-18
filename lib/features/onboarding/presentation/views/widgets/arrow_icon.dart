import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/appImages.dart';

class ArrowIcon extends StatelessWidget {
  const ArrowIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.imagesArrowIcon);
  }
}
