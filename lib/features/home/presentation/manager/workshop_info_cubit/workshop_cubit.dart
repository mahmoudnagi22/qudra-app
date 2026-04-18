import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/home/domain/repos/home_repo.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_states.dart';

class WorkShopCubit extends Cubit<WorkShopInfoStates> {
  WorkShopCubit(this.homeRepo) : super(WorkShopInfoInitailState());
  HomeRepo homeRepo;
  Future<void> getWorkShopInfo(
      {required String token ,bool? isRefresh}) async {
         
    emit(WorkShopInfoLoadingState());
    final result =
        await homeRepo.getWorkShopInfo(token: token, isRefresh: isRefresh);
    result.fold(
      (failure) {
        emit(WorkShopInfoErrorState(failure.errorMessage));
      },
      (data) {
        emit(WorkShopInfoSucsessState(data));
      },
    );
  }
}
