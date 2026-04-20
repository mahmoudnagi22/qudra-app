import 'package:flutter/material.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/accept_request_view_body.dart';

class AcceptRequestView extends StatelessWidget {
  const AcceptRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AcceptRequestViewBody(),
    );
  }
}
