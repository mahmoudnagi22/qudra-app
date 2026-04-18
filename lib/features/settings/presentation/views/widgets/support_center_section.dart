import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/services/whatsapp_launcher_service.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/settings/presentation/models/support_request_type.dart';
import 'package:qodraapp/generated/l10n.dart';

class SupportCenterSection extends StatefulWidget {
  const SupportCenterSection({super.key});

  @override
  State<SupportCenterSection> createState() => _SupportCenterSectionState();
}

class _SupportCenterSectionState extends State<SupportCenterSection> {
  static const String _supportPhone = '+201222383573';
  final TextEditingController _controller = TextEditingController();
  final WhatsAppLauncherService _whatsAppService = WhatsAppLauncherService();

  SupportRequestType _selectedType = SupportRequestType.contact;
  bool _isSending = false;
  bool _messagePrepared = false;
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final canSend = _controller.text.trim().isNotEmpty;
    if (canSend == _canSend) {
      return;
    }
    setState(() {
      _canSend = canSend;
      if (canSend) {
        _messagePrepared = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [AppShadows.dropShadow],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.helpSupportCenterTitle,
                style: AppTextStyles.text18Medium,
              ),
              SizedBox(height: 6.h),
              Text(
                l10n.helpSupportCenterSubtitle,
                style: AppTextStyles.text14Regular.copyWith(
                  color: AppColors.darkGray,
                  height: 1.35,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 14.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: SupportRequestType.values
                    .map((type) => _SupportTypeChip(
                          type: type,
                          isSelected: _selectedType == type,
                          onTap: () {
                            setState(() {
                              _selectedType = type;
                            });
                          },
                        ))
                    .toList(),
              ),
              SizedBox(height: 14.h),
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(10.w, 6.h, 10.w, 6.h),
                decoration: BoxDecoration(
                  color: AppColors.mainLight,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '${l10n.supportRequestTypeLabel}: ${_selectedType.title(l10n)}',
                  style: AppTextStyles.text12Regular.copyWith(
                    color: AppColors.mainDark,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: _controller,
                minLines: 3,
                maxLines: 6,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: l10n.supportMessagePlaceholder,
                  hintStyle: AppTextStyles.text14Regular.copyWith(
                    color: AppColors.gray,
                  ),
                  filled: true,
                  fillColor: AppColors.mainLight.withValues(alpha: 0.45),
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 12.w, vertical: 12.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                        color: AppColors.lightGray.withValues(alpha: 0.7)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                        color: AppColors.lightGray.withValues(alpha: 0.7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                        const BorderSide(color: AppColors.main, width: 1.2),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _canSend ? AppColors.main : AppColors.lightGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed:
                      _canSend && !_isSending ? _sendSupportMessage : null,
                  child: _isSending
                      ? SizedBox(
                          width: 18.w,
                          height: 18.h,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.white,
                          ),
                        )
                      : Text(
                          l10n.supportSendButton,
                          style: AppTextStyles.text16Medium
                              .copyWith(color: AppColors.white),
                        ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                l10n.supportComposerHint,
                style: AppTextStyles.text12Regular
                    .copyWith(color: AppColors.darkGray),
                textAlign: TextAlign.start,
              ),
              if (_messagePrepared) ...[
                SizedBox(height: 6.h),
                Text(
                  l10n.supportPreparedState,
                  style: AppTextStyles.text12Regular
                      .copyWith(color: AppColors.mainDarker),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendSupportMessage() async {
    final l10n = S.of(context);
    final messageBody = _controller.text.trim();
    if (messageBody.isEmpty) {
      _showSnackBar(l10n.supportEmptyMessageError);
      return;
    }

    setState(() {
      _isSending = true;
    });

    final fullMessage = _composeMessage(l10n: l10n, userMessage: messageBody);
    final result = await _whatsAppService.launchSupportMessage(
      phone: _supportPhone,
      message: fullMessage,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _isSending = false;
    });

    if (result.isSuccess) {
      _controller.clear();
      setState(() {
        _messagePrepared = true;
      });
      _showSnackBar(l10n.supportLaunchSuccess);
      return;
    }

    _showSnackBar(l10n.supportLaunchFailure);
  }

  String _composeMessage({required S l10n, required String userMessage}) {
    return [
      l10n.supportTemplateGreeting,
      '${l10n.supportRequestTypeLabel}: ${_selectedType.title(l10n)}',
      '${l10n.supportMessageLabel}: $userMessage',
    ].join('\n');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.start),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _SupportTypeChip extends StatelessWidget {
  const _SupportTypeChip({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  final SupportRequestType type;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsetsDirectional.fromSTEB(10.w, 9.h, 10.w, 9.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isSelected ? AppColors.mainLight : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.main : AppColors.lightGray,
            width: isSelected ? 1.2 : 1,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 130.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                type.icon,
                size: 18.sp,
                color: isSelected ? AppColors.main : AppColors.darkGray,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type.title(l10n),
                      style: AppTextStyles.text14Medium.copyWith(
                        color:
                            isSelected ? AppColors.mainDark : AppColors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      type.description(l10n),
                      style: AppTextStyles.text12Regular.copyWith(
                        color: AppColors.darkGray,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
