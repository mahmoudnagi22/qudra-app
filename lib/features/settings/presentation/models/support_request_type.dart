import 'package:flutter/material.dart';
import 'package:qodraapp/generated/l10n.dart';

enum SupportRequestType {
  complaint,
  suggestion,
  serviceIssue,
  contact,
}

extension SupportRequestTypeX on SupportRequestType {
  IconData get icon {
    switch (this) {
      case SupportRequestType.complaint:
        return Icons.report_problem_outlined;
      case SupportRequestType.suggestion:
        return Icons.lightbulb_outline;
      case SupportRequestType.serviceIssue:
        return Icons.build_outlined;
      case SupportRequestType.contact:
        return Icons.support_agent_outlined;
    }
  }

  String title(S l10n) {
    switch (this) {
      case SupportRequestType.complaint:
        return l10n.supportTypeComplaintTitle;
      case SupportRequestType.suggestion:
        return l10n.supportTypeSuggestionTitle;
      case SupportRequestType.serviceIssue:
        return l10n.supportTypeServiceIssueTitle;
      case SupportRequestType.contact:
        return l10n.supportTypeContactTitle;
    }
  }

  String description(S l10n) {
    switch (this) {
      case SupportRequestType.complaint:
        return l10n.supportTypeComplaintDesc;
      case SupportRequestType.suggestion:
        return l10n.supportTypeSuggestionDesc;
      case SupportRequestType.serviceIssue:
        return l10n.supportTypeServiceIssueDesc;
      case SupportRequestType.contact:
        return l10n.supportTypeContactDesc;
    }
  }
}
