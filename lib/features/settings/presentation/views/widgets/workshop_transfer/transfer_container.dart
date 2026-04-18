import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qodraapp/core/functions/show_warning_dialog.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_states.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/features/settings/presentation/manager/transfer%20workshop%20cubit/transfer_cubit.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/workshop_transfer/custom_text_field_transferTo.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/workshop_transfer/section_title.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/workshop_transfer/workshop_name_trans.dart';
import 'package:qodraapp/generated/l10n.dart';

class TransferContainer extends StatefulWidget {
  const TransferContainer({super.key});

  @override
  State<TransferContainer> createState() => _TransferContainerState();
}

class _TransferContainerState extends State<TransferContainer> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController fromCodeController = TextEditingController();
  final TextEditingController toCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCurrentWorkshop();
  }

  @override
  void dispose() {
    fromCodeController.dispose();
    toCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.main, width: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              SectionTitle(
                title: S.of(context).from_workshop,
              ),
              SizedBox(
                height: 10.h,
              ),
              BlocBuilder<WorkShopCubit, WorkShopInfoStates>(
                builder: (context, state) {
                  final bool isLoading = state is WorkShopInfoLoadingState ||
                      state is WorkShopInfoInitailState;
                  String workshopName = S.of(context).workshopNameUnavailable;
                  if (state is WorkShopInfoSucsessState) {
                    final String? name = state.workShopEntity.name;
                    if (name != null && name.trim().isNotEmpty) {
                      workshopName = name;
                    }
                  }
                  return WorkShopNameTrans(
                    name: workshopName,
                    isLoading: isLoading,
                    label: S.of(context).currentWorkshopLabel,
                  );
                },
              ),
              SizedBox(height: 12.h),
              CustomTextFieldTransfer(
                textEditingController: fromCodeController,
                txt: S.of(context).transferFromCodePlaceholder,
                maxLines: 1,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).transferValidationFromCodeRequired;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              Center(child: SvgPicture.asset(Assets.imagesTransfer)),
              SizedBox(
                height: 25.h,
              ),
              SectionTitle(
                title: S.of(context).to_workshop,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFieldTransfer(
                textEditingController: toCodeController,
                txt: S.of(context).transferToCodePlaceholder,
                maxLines: 1,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).transferValidationToCodeRequired;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomTextButton(
                    text: S.of(context).transfer_button,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        transfer(context);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void transferWorkshop({
    required String fromCode,
    required String toCode,
  }) async {
    String? token = await SecurePrefs.getString(tokenSecureKey);
    if (token != null) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<TransferCubit>(context).transferWorkshop(
        token: token,
        fromCode: fromCode,
        toCode: toCode,
      );
    }
  }

  //-------------------------------------------------
  void transfer(BuildContext context) {
    FocusScope.of(context).unfocus();
    showWarningDialog(
      context,
      accept: () {
        Navigator.pop(context);
        transferWorkshop(
          fromCode: fromCodeController.text.trim(),
          toCode: toCodeController.text.trim(),
        );
      },
      reject: () {
        Navigator.pop(context);
      },
      txt: S.of(context).transfer_warning,
    );
  }

  Future<void> _fetchCurrentWorkshop() async {
    final String? token = await SecurePrefs.getString(tokenSecureKey);
    if (token == null || token.isEmpty) {
      return;
    }
    if (!mounted) {
      return;
    }
    // ignore: use_build_context_synchronously
    BlocProvider.of<WorkShopCubit>(context).getWorkShopInfo(token: token);
  }
}
