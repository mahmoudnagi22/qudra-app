import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/square_container_code.dart';

class OtpRowCodes extends StatelessWidget {
  const OtpRowCodes({
    super.key,
    required this.textEditingControllerList,
  });

  final List<TextEditingController> textEditingControllerList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              6,
              (index) => SquareContainerCode(
                  textEditingController: textEditingControllerList[index]))),
    );
  }
}
