
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_owner_events.dart';
import 'create_owner_state.dart';

class CreateOwnerBloc extends Bloc<CreateOwnerEvents, CreateOwnerState> {
  CreateOwnerBloc() : super(CreateOwnerPersonalInfoState()) {
    on<CreateOwnerPersonalInfoEvent>((event, emit) {
      emit(CreateOwnerPersonalInfoState());
    });
    on<CreateOwnerSalonDetailsEvent>((event, emit) {
      emit(CreateOwnerSalonDetailsState());
    });
    on<CreateOwnerConfirmEvent>((event, emit) {
      emit(CreateOwnerConfirmState());
    });
  }
}