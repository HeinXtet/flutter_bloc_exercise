import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/timer/bloc/bloc.dart';
import 'package:flutter_tmdb/timer/view/Actions.dart';

class TimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            final String minutesStr =
                ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
            final String secondsStr =
                (state.duration % 60).floor().toString().padLeft(2, '0');
            return Text('$minutesStr:$secondsStr');
          },
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<TimerBloc, TimerState>(
          buildWhen: (previousState, state) =>
              state.runtimeType != previousState.runtimeType,
          builder: (context, state) => TimerActions(),
        ),
      ],
    );
  }
}
