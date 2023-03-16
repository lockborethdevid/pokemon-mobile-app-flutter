import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokenmon_mobile_app/bloc/pokemons_data/pokemon_bloc.dart';
import 'package:pokenmon_mobile_app/bloc/cubit/theme_state_cubit.dart';
import 'package:pokenmon_mobile_app/bloc/pokemons_data/pokemon_event.dart';
import 'package:pokenmon_mobile_app/pages/home_screen.dart';
import 'package:pokenmon_mobile_app/repository/pokemon_repository.dart';
import 'package:get/get.dart';

void main() {
  // runApp(MultiBlocProvider(
  //     providers: [BlocProvider(create: (context) => ThemeStateCubit())],
  //     child: MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider(
      create: (context) => PokemonRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(create: (context) => PokemonBloc(RepositoryProvider.of<PokemonRepository>(context),)..add(LoadPokemonEvent()))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter PokemonApp",
            home: HomeScreen()),
      ),
    );
    // ThemeStateCubit theme = BlocProvider.of(context, listen: true);
    // return BlocBuilder<ThemeStateCubit, ThemeData>(builder: (context, state) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     // theme: ThemeData.light().copyWith(),
    //     theme: state,
    //     home: RepositoryProvider(
    //       create: (context) => PokemonRepository(),
    //       child: const HomeScreen(),
    //     ),
    //   );
    // });
  }
}
