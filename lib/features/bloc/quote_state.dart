import 'package:flutter_bloc_study/models/quote_model.dart';

abstract class QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteErrorState extends QuoteState {
  final String message;
  QuoteErrorState(this.message);
}

class QuoteLoadedState extends QuoteState {
  final QuoteModel model;
  QuoteLoadedState(this.model);
}
