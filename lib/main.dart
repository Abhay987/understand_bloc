import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_size/flutter_size.dart';
import 'package:understanding_bloc_advanced/blocs/first_bloc_cubit.dart';
import 'package:understanding_bloc_advanced/blocs/second_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Understanding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => FirstBlocCubit()),
        BlocProvider(create: (context) => SecondCubit()),
      ],child: const BlocUnderstanding(),)
    );
  }
}

class BlocUnderstanding extends StatefulWidget {
  const BlocUnderstanding({Key? key}) : super(key: key);

  @override
  State<BlocUnderstanding> createState() => _BlocUnderstandingState();
}

class _BlocUnderstandingState extends State<BlocUnderstanding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<FirstBlocCubit,FirstBlocState>(builder: (context,firstState){
        return BlocBuilder<SecondCubit,SecondState>(builder: (context,secondState){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("First value : ${firstState.firstValue}"),
               40.verticalSpaceBetweenWidgets,
                Text("Second value : ${secondState.secondValue}"),
                40.verticalSpaceBetweenWidgets,
                ElevatedButton(onPressed: (){
                  var firstCubit = context.read<FirstBlocCubit>();
                  int value = firstCubit.state.firstValue;
                  firstCubit.updateFirstValue(firstValue: ++value);
                }, child: const Text('First Value Changed')),
                40.verticalSpaceBetweenWidgets,
                ElevatedButton(onPressed: (){
                  var secondCubit = context.read<SecondCubit>();
                  secondCubit.secondCubitUpdate(secondValue: "Hlo");

                }, child: const Text('Second Value Changed')),
                40.verticalSpaceBetweenWidgets,
              ],
            ),
          );
        });
      },),
    ));
  }
}
