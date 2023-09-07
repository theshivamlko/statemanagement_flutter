import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/bloc/CounterCubit.dart';

import 'BlocPage2.dart';
import 'CounterCubit2.dart';

class BlocPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("BlocPage1 build  ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BLOC App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bloc Provider ${BlocProvider.of<CounterCubit>(context).state.counter} ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: Text("Counter")),
            Text(
              '============',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            BlocBuilder<CounterCubit, AppState>(builder: (context, bloc) {
              print("BlocPage1 BlocBuilder build  ");
              return GestureDetector(
                onTap: () {},
                child: Text(
                  'BlocBuilder ${BlocProvider.of<CounterCubit>(context).state.counter} ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
            BlocListener<CounterCubit, AppState>(
                listener: (context, state) {
                  print("BlocPage1 Listener build  ");
                  /*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Count ${BlocProvider.of<CounterCubit>(context).state.counter}"),
                    duration: Duration(seconds: 1),
                  ));*/
                },
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: Text(
                    'BlocListener ${BlocProvider.of<CounterCubit>(context).state.counter} ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )),
            BlocConsumer<CounterCubit, AppState>(listener: (context, state) {
              print("BlocPage1 BlocConsumer build  ");
              /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    "BlocConsumer ${BlocProvider.of<CounterCubit>(context).state.counter}"),
                duration: Duration(seconds: 1),
              ));*/
            }, builder: (context, bloc) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: Text(
                  'BlocConsumer ${BlocProvider.of<CounterCubit>(context).state.counter} ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MultiBlocProvider(
                                providers: [
                                  BlocProvider<CounterCubit>(
                                    create: (context) => CounterCubit(),
                                  ),
                                  BlocProvider<CounterCubit2>(
                                    create: (context) => CounterCubit2(),
                                  ),
                                ],
                            child: BlocPage2(),
                              )));
                },
                child: Text("BLOC Page 2")),
          ],
        ),
      ),
    );
  }
}
