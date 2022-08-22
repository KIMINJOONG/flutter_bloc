import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/features/repository/quote_repository.dart';
import 'package:flutter_bloc_study/features/ui/quote_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => QuoteRepository(),
      child: const MaterialApp(
        home: QuoteScreen(),
      ),
    );
  }
}
