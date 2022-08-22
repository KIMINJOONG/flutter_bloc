import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/features/bloc/quote_bloc.dart';
import 'package:flutter_bloc_study/features/bloc/quote_event.dart';
import 'package:flutter_bloc_study/features/bloc/quote_state.dart';
import 'package:flutter_bloc_study/features/repository/quote_repository.dart';
import 'package:flutter_bloc_study/features/ui/wigets/quote_widget.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Quote'),
      ),
      body: BlocProvider<QuoteBloc>(
        create: (context) =>
            QuoteBloc(RepositoryProvider.of<QuoteRepository>(context))
              ..add(LoadQuoteEvent()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<QuoteBloc, QuoteState>(
              builder: (context, state) {
                if (state is QuoteErrorState) {
                  return Text(
                    state.message,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  );
                } else if (state is QuoteLoadedState) {
                  return QuoteWidget(
                    model: state.model,
                    onPressed: () => context.read<QuoteBloc>().add(
                          LoadQuoteEvent(),
                        ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
