import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/chatbot/domain/repos/ai_repo.dart';
import 'package:qodraapp/features/chatbot/presentation/manager/ai_cubit/ai_states.dart';

class AiCubit extends Cubit<AiStates> {
  AiCubit( this.aiRepo) : super(AiResponseinit());
  AiRepo aiRepo;

  Future<void> getAiResponse({required String msg}) async {
    emit(AiResponseLoading());
    var result = await aiRepo.getAiResponse(msg: msg);
    result.fold((faluire) {
      emit(AiResponseFaluire(faluire.errorMessage));
    }, (result) {
      emit(AiResponseSucsess(result));
    });
  }
}
