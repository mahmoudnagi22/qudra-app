import 'package:flutter/material.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/service%20history%20view%20body/service_history_item.dart';
import 'package:qodraapp/generated/l10n.dart';

class ServiceHistoryViewBody extends StatelessWidget {
  const ServiceHistoryViewBody({
    super.key, 
    required this.sessionsList, 
  });

  final List<ServiceEntity> sessionsList;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          CustomAppBar(
            txt: S.of(context).ServiceHistory,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: sessionsList.length,
            itemBuilder: (context, index) {
              return ServiceHistoryItem(
                serviceNum: index + 1,
                serviceEntity: sessionsList[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
