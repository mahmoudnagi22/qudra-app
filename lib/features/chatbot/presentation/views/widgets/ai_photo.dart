import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPhoto extends StatelessWidget {
  const ChatPhoto({
    super.key,
    required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: SizedBox(height: 39.94.h, width: 39.94.w, child: Image.asset(img)),
    );
  }
}
