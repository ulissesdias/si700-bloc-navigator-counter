import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:si1700_bloc_navigator_counter/bloc/counter_bloc.dart';
import 'package:si1700_bloc_navigator_counter/view/app_router.dart';
import 'package:si1700_bloc_navigator_counter/view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocalAppRouter _localAppRouter = LocalAppRouter();

  @override
  Widget build(BuildContext context) {
/* // Global
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
*/

    // Local
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*
      home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
          child: MyHomePage(title: 'Flutter Demo Home Page')),*/
      onGenerateRoute: _localAppRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _localAppRouter.dispose();
    super.dispose();
  }
}
