import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'share_post_event.dart';
part 'share_post_state.dart';

class SharePostBloc extends Bloc<SharePostEvent, SharePostState> {
  SharePostBloc() : super(SharePostInitial()) {
    on<SharePostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
