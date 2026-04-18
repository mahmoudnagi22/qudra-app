import 'package:qodraapp/core/services/api_services.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/constants.dart';

abstract class SettingsRemoteDataSources {
  Future<void> transferWorkshop(
      {required String token,
      required String fromCode,
      required String toCode,
      required String reason});
}

class SettingsRemoteDataSourcesImpl implements SettingsRemoteDataSources {
  ApiServices apiServices;
  SettingsRemoteDataSourcesImpl({required this.apiServices});
  @override
  Future<void> transferWorkshop(
      {required String token,
      required String fromCode,
      required String toCode,
      required String reason}) async {
    await apiServices.postData(
        token: token,
        queryParameters: {"lang": SharedPrefs.getString(selectedLanguageType)},
        endPoint: '/api/TransferRequest/CreateTransferRequest',
        data: {"fromCode": fromCode, "code": toCode, "reason": reason},
        isFormData: false);
  }
}
