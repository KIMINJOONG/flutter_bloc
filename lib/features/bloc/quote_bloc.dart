import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/features/bloc/quote_event.dart';
import 'package:flutter_bloc_study/features/bloc/quote_state.dart';
import 'package:flutter_bloc_study/features/repository/quote_repository.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository _repository;

  QuoteBloc(this._repository) : super(QuoteLoadingState()) {
    on<LoadQuoteEvent>((event, emit) async {
      emit(QuoteLoadingState());

      try {
        final model = await _repository.getQuoute();
        emit(QuoteLoadedState(model));
      } catch (e) {
        emit(QuoteErrorState(e.toString()));
      }
    });
  }
}
