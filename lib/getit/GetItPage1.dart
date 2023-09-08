import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/bloc/CounterCubit.dart';


class GetItPage1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    init();
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
              'BlocProvider CounterCubit ${BlocProvider.of<CounterCubit>(context).state.counter} ',
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
                  'BlocBuilder CounterCubit ${BlocProvider.of<CounterCubit>(context).state.counter} ',
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
                    'BlocListener CounterCubit ${BlocProvider.of<CounterCubit>(context).state.counter} ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )),

            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/bloc2");
                },
                child: Text("BLOC Page 2")),
          ],
        ),
      ),
    );
  }


   void init() async {



  }
}
