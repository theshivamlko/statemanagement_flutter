import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/bloc/CounterCubit.dart';

import 'CounterCubit2.dart';

class BlocPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("BlocPage2 build  ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BLOC App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, AppState>(builder: (context, bloc) {
              return Text(
                  'BlocBuilder CounterCubit ${BlocProvider.of<CounterCubit>(context).state.counter} \n'
                      'BlocBuilder CounterCubit2 ${BlocProvider.of<CounterCubit2>(context).state.counter} ',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                  BlocProvider.of<CounterCubit2>(context).increment();
                },
                child: Text("Counter")),
            Text(
              '============',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

          ],
        ),
      ),
    );
  }
}
