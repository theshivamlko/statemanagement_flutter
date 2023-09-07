import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/bloc/CounterCubit.dart';

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
            BlocBuilder<CounterCubit,AppState>(builder: (context, bloc) {
              print("BlocPage1 BlocBuilder build  ");
              return GestureDetector(
                onTap: () {
                 },
                child: Text(
                  'BlocBuilder ${BlocProvider.of<CounterCubit>(context).state.counter} ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
