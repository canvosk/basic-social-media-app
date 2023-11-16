import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc(this._registerUseCase) : super(RegisterInitial()) {
    on<Register>((event, emit) async {
      emit(Registering());
      try {
        UserEntitiy user = await _registerUseCase.call(params: event.user);
        emit(RegisterSuccess(user));
      } catch (e) {
        emit(RegisterFailed(e.toString())); 
      }
    });
  }
}
