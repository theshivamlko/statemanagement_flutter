import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/bloc/CounterCubit.dart';

import 'CounterCubit2.dart';
import 'GlobalCounterCubit.dart';

class BlocPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("BlocPage2 build  ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BLOCPage2 App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, AppState>(builder: (context, bloc) {
              return Text(
                'BlocBuilder CounterCubit ${BlocProvider.of<CounterCubit>(context).state.counter} \n'
                'BlocBuilder CounterCubit2 ${BlocProvider.of<CounterCubit2>(context).state.counter} \n'
                ' GlobalCounterCubit ${BlocProvider.of<GlobalCounterCubit>(context).state.counter} ',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                  // BlocProvider.of<CounterCubit2>(context).increment();
                },
                child: Text("Counter")),
            Text(
              '============',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ChildWidget()
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    print("BlocPage2 ChildWidget build  ");

    var bloc = context.watch<CounterCubit>();

    return Column(
      children: [
        Builder(builder: (context) {
          var bloc2 = context.watch<CounterCubit2>();
          print("BlocPage2 ChildWidget Builder  ");
          return GestureDetector(
              onTap: () {
                context.read<CounterCubit2>().increment();
              },
              child: Text(
                'BLOC1 State ${bloc?.state.counter} ${bloc2?.state.counter}',
                style: TextStyle(fontSize: 20),
              ));
        }),
        Builder(builder: (context) {
          var num =
              context.select((CounterCubit cubit) => cubit.state.counter2);
          return GestureDetector(
              onTap: () {
                context.read<CounterCubit2>().increment2();
              },
              child: Text(
                'BLOC1 SELECT  ${num}',
                style: TextStyle(fontSize: 20),
              ));
        })
      ],
    );
  }
}
