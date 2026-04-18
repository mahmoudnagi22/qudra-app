// ignore: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/home/domain/repos/home_repo.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoStates.dart';

class UserInfoCubit extends Cubit<Userinfostates> {
  UserInfoCubit(this.homeRepo) : super(UserInfoInitialState());
  HomeRepo homeRepo;

  Future<void> fetchUserInfo({required String id , bool? isRefresh = false}) async {
    emit(UserInfoLoadingState());
    var result = await homeRepo.getUserInfo(id: id , isRefresh: isRefresh);
    result.fold((faluire) {
      emit(UserInfoErrorState(faluire.errorMessage));
    }, (sucsess) {
      emit(UserInfoSucsessState(sucsess));
    });
  }
}
