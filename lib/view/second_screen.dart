import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:si1700_bloc_navigator_counter/bloc/counter_bloc.dart';
import 'package:si1700_bloc_navigator_counter/bloc/counter_state.dart';

class MySecondPage extends StatefulWidget {
  MySecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
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
                        return BlocProvider(
                            create: (context) => CounterBloc(),
                            child: MySecondPage(title: "Third Page"));
                      }));*/
                      Navigator.of(context).pushNamed("/third");
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
