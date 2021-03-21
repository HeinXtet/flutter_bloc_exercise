import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/timer/bloc/bloc.dart';

class TimerActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButton(
          timerBloc: BlocProvider.of<TimerBloc>(context)),
    );
  }
}

_mapStateToActionButton({TimerBloc timerBloc}) {
  final TimerState currentState = timerBloc.state;

  if (currentState is TimerInitial) {
    return [
      FloatingActionButton(
        onPressed: () => timerBloc.add(
          TimerStarted(duration: currentState.duration),
        ),
        child: Icon(Icons.play_arrow),
      )
    ];
  }


  if(currentState is TimerRunInProgress){
    return [
      FloatingActionButton(
        child: Icon(Icons.pause),
        onPressed: () => timerBloc.add(TimerPaused()),
      ),
      FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () => timerBloc.add(TimerReset()),
      ),
    ];
  }

  if (currentState is TimerRunPause) {
    return [
      FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () => timerBloc.add(TimerResumed()),
      ),
      FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () => timerBloc.add(TimerReset()),
      ),
    ];
  }
  if (currentState is TimerRunComplete) {
    return [
      FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () => timerBloc.add(TimerReset()),
      ),
    ];
  }

  return [];

}
