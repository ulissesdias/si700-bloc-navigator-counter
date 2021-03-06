import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:si1700_bloc_navigator_counter/bloc/counter_bloc.dart';
import 'package:si1700_bloc_navigator_counter/bloc/counter_state.dart';
import 'package:si1700_bloc_navigator_counter/view/second_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                '${state.counterValue}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(CounterEvent.increment);
                    },
                    child: Icon(Icons.add)),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(CounterEvent.decrement);
                    },
                    child: Icon(Icons.remove)),
                ElevatedButton(
                    onPressed: () {
                      /*
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return BlocProvider.value(
                            value: BlocProvider.of<CounterBloc>(context),
                            child: MySecondPage(title: "Second Page"));
                      }));*/
                      Navigator.of(context).pushNamed("/second");
                    },
                    child: Icon(Icons.forward))
              ],
            )
          ],
        ),
      ),
    );
  }
}
