import 'package:bloc/bloc.dart';
import 'package:si1700_bloc_navigator_counter/bloc/counter_state.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterState(counterValue: state.counterValue + 1);
        break;
      case CounterEvent.decrement:
        yield CounterState(counterValue: state.counterValue - 1);
        break;
    }
  }
}
