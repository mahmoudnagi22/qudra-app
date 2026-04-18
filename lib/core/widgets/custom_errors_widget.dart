import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/widgets/error_widget.dart';

class CustomErrorsWidgets extends StatelessWidget {
  const CustomErrorsWidgets(
      {super.key,
      this.onPressed,
      required this.txt1,
      required this.txt2,
      required this.photo, required this.title});
  final void Function()? onPressed;
  final String txt1;
  final String txt2;
  final String photo;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Container(
        decoration: boxDecoration,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(title , style: AppTextStyles.text16Medium,),
                  ),
                ],
              ),
              ErrorWidgetUi(txt1: txt1, txt2: txt2, photo: photo , onPressed: onPressed,),
            ],
          ),
        ),
      ),
    );
  }
}
