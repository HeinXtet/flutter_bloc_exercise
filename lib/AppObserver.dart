
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template app_observer}
/// [BlocObserver] for the application which
/// observes all [Bloc] state changes.
/// {@endtemplate}
class AppObserver extends BlocObserver{


  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }
}