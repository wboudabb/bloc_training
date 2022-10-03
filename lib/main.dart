import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/color/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: MaterialApp(
        home: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
            return Container(
              color: state.color,
              child: FloatingActionButton(
                onPressed: () {
                  context.read<ColorBloc>().add(ChangeColorEvent());
                  if (kDebugMode) {
                    print("Pressed ...${state.color}");
                  }
                },
                backgroundColor: state.color,
              ),
            );
          },
        ),
      ),
    );
  }
}
