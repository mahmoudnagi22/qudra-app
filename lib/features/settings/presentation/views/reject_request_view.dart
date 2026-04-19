import 'package:flutter/material.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/reject_request_view_body.dart';

class RejectRequestView extends StatelessWidget {
  const RejectRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RejectRequestViewBody(),

    );
  }
}
