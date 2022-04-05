import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_drive/injection_container.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_test_drive/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:flutter_test_drive/number_trivia/presentation/bloc/number_trivia_event.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Number Trivia")),
      body: buildBody(context),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                    builder: (context, state) {
                  if (state is Empty) {
                    return const TextMessage(message: 'Try Searching');
                  }
                  if (state is Error) {
                    return TextMessage(message: state.error);
                  }
                  if (state is Loading) {
                    return const LoadingWidget();
                  }
                  if (state is Loaded) {
                    return TriviaNumberWidget(trivia: state.trivia);
                  }
                  return const Placeholder();
                })),
            const Expanded(child: _TriviaController())
          ],
        ),
      ),
    );
  }
}

class _TriviaController extends StatefulWidget {
  const _TriviaController({Key? key}) : super(key: key);

  @override
  State<_TriviaController> createState() => _TriviaControllerState();
}

class _TriviaControllerState extends State<_TriviaController> {
  String _inputStr = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(border: OutlineInputBorder(),hintText: 'Input number'),
            onChanged: (value) {
              _inputStr = value;
            } ,),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children:  [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<NumberTriviaBloc>(context)
                            .add(GetNumberTriviaEvent(number: _inputStr));
                      },
                      child: const Text('Search'))),
              const SizedBox(width: 10),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<NumberTriviaBloc>(context)
                            .add(const GetRandomNumberTriviaEvent());
                      },
                      child: const Text('Random'))),
            ],
          ),
        )
      ],
    );
  }
}


class TextMessage extends StatelessWidget {
  final String message;

  const TextMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              message,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}

class TriviaNumberWidget extends StatelessWidget {
  final NumberTrivia trivia;

  const TriviaNumberWidget({Key? key, required this.trivia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(children: [
          Text(
            trivia.number.toString(),
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
                child: SingleChildScrollView(
                    child: Text(
              trivia.text,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ))),
          )
        ]));
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 14),
              )
            ]),
      ),
    );
  }
}
