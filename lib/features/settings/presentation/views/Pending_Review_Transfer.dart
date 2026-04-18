import 'package:flutter/material.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/pending_transfer_view.dart';

class PendingTransferView extends StatelessWidget {
  const PendingTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PendingTransferViewBody(),
    );
  }
}
