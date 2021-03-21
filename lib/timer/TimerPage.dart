import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/timer/Ticker.dart';
import 'package:flutter_tmdb/timer/bloc/bloc.dart';
import 'package:flutter_tmdb/timer/view/TimerView.dart';
import 'package:flutter_tmdb/timer/view/WaveBackground.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Timer Example",
        ),
      ),
      body: BlocProvider(
        create: (context) => TimerBloc(
          ticker: Ticker(),
        ),
        child: Stack(
          children: [
            WaveBackground(),
            TimerView()
          ],
        ),
      ),
    );
  }
}
