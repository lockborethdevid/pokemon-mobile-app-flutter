import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pokenmon_mobile_app/bloc/pokemons_data/pokemon_bloc.dart';
import 'package:pokenmon_mobile_app/bloc/pokemons_data/pokemon_event.dart';
import 'package:pokenmon_mobile_app/bloc/pokemons_data/pokemon_state.dart';
import 'package:pokenmon_mobile_app/bloc/cubit/theme_state_cubit.dart';
import 'package:pokenmon_mobile_app/pages/pokemon_info_screen.dart';
import 'package:pokenmon_mobile_app/repository/pokemon_repository.dart';
import 'package:pokenmon_mobile_app/model/pokemon_response.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Store List of Pokemon Info
  late List PokemonData = [];

  @override
  Widget build(BuildContext context) {
    final theme_status = context.select((ThemeStateCubit bloc) => bloc.state);
    ThemeStateCubit theme = BlocProvider.of(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(body: BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state is PokemonLoadingState) {
          return Container(
            // child: Center(child: Text(" Pokemon on the way")),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is PokemonLoadedState) {
          List<PokenmonList> PokemonData = state.pokemons;
          return Stack(children: [
            // Background Image
            Positioned(
              top: 25,
              right: 10,
              child: Image.asset(
                'images/pokemon-logo.png',
                width: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
                top: 140,
                left: 30,
                child: Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      theme.changeTheme();
                    },
                    child: Text(theme_status == ThemeData.light() ? "Dark" : "Light", style: TextStyle(color: theme_status == ThemeData.light() ? Colors.black : Colors.white ),),
                  ),
                )),
            // Home Screen Title
            Positioned(
                top: 50,
                left: 20,
                child: Text(
                  "POKEMON GO \nCatch Y'all",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
            // List of Pokemon Info Cards
            Positioned(
              top: 180,
              bottom: 0,
              width: width,
              child: Column(
                children: [
                  PokemonData.isNotEmpty
                      ? Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.4),
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: PokemonData.length,
                              itemBuilder: (context, index) {
                                final List<dynamic> TypeList =
                                    PokemonData[index].typeofpokemon;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: InkWell(
                                    child: SafeArea(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            // color: Colors.green,
                                            color: PokemonData[index]
                                                        .typeofpokemon[0] ==
                                                    "Grass"
                                                ? Colors.greenAccent
                                                : PokemonData[index]
                                                                .typeofpokemon[
                                                            0] ==
                                                        "Fire"
                                                    ? Colors.redAccent
                                                    : PokemonData[index]
                                                                    .typeofpokemon[
                                                                0] ==
                                                            "Water"
                                                        ? Colors.blue
                                                        : PokemonData[index]
                                                                        .typeofpokemon[
                                                                    0] ==
                                                                "Poison"
                                                            ? Colors
                                                                .deepPurpleAccent
                                                            : PokemonData[index].typeofpokemon[
                                                                        0] ==
                                                                    "Fighting"
                                                                ? Colors
                                                                    .orange
                                                                : PokemonData[index].typeofpokemon[0] ==
                                                                        "Bug"
                                                                    ? Colors
                                                                        .lightGreenAccent
                                                                    : PokemonData[index].typeofpokemon[0] ==
                                                                            "Electric"
                                                                        ? Colors.amber
                                                                        : PokemonData[index].typeofpokemon[0] == "Rock"
                                                                            ? Colors.grey
                                                                            : PokemonData[index].typeofpokemon[0] == "Ground"
                                                                                ? Colors.brown
                                                                                : PokemonData[index].typeofpokemon[0] == "Psychic"
                                                                                    ? Colors.indigo
                                                                                    : PokemonData[index].typeofpokemon[0] == "Ghost"
                                                                                        ? Colors.deepPurple
                                                                                        : PokemonData[index].typeofpokemon[0] == "Normal"
                                                                                            ? Colors.grey
                                                                                            : Colors.pink,
                                            borderRadius: const BorderRadius.all(Radius.circular(25))),
                                        child: Stack(
                                          children: [
                                            // Pokemon ID
                                            Positioned(
                                                right: 15,
                                                top: 10,
                                                child: Text(
                                                  PokemonData[index].id,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                )),

                                            // Pokemon Name Section
                                            Positioned(
                                              top: 10,
                                              left: 15,
                                              child: Text(
                                                PokemonData[index].name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    shadows: [
                                                      BoxShadow(
                                                          color:
                                                              Colors.blueGrey,
                                                          offset:
                                                              Offset(0, 0),
                                                          spreadRadius: 1.0,
                                                          blurRadius: 15)
                                                    ]),
                                              ),
                                            ),

                                            // Pokemon Type Section
                                            Positioned(
                                              top: 40,
                                              left: 15,
                                              child: Container(
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10,
                                                            top: 5,
                                                            bottom: 5),
                                                    child: Column(
                                                        children:
                                                            TypeList.map(
                                                                    (item) =>
                                                                        Text(
                                                                          item,
                                                                          style:
                                                                              const TextStyle(color: Colors.white, fontSize: 12, shadows: [
                                                                            BoxShadow(color: Colors.blueGrey, offset: Offset(0, 0), spreadRadius: 1.0, blurRadius: 15)
                                                                          ]),
                                                                        ))
                                                                .toList())),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius
                                                                .all(
                                                            Radius.circular(
                                                                20)),
                                                    color: Colors.black
                                                        .withOpacity(0.5)),
                                              ),
                                            ),

                                            // Pokemon ball background
                                            Positioned(
                                              bottom: -10,
                                              right: -10,
                                              child: Opacity(
                                                opacity: 0.15,
                                                child: Image.asset(
                                                  'images/pokemon-ball.png',
                                                  height: 100,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),

                                            // Pokemon Image Section
                                            Positioned(
                                              bottom: 5,
                                              right: 5,
                                              child: Hero(
                                                tag: index,
                                                child: CachedNetworkImage(
                                                    imageUrl:
                                                        PokemonData[index]
                                                            .imageurl,
                                                    height: 100,
                                                    fit: BoxFit.fitHeight,
                                                    placeholder:
                                                        (context, url) =>
                                                            const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetailScreen(
                                                    pokemonIndex: index,
                                                    pokemonInfo:
                                                        PokemonData[index],
                                                    color: PokemonData[index]
                                                                    .typeofpokemon[
                                                                0] ==
                                                            "Grass"
                                                        ? Colors.greenAccent
                                                        : PokemonData[index]
                                                                        .typeofpokemon[
                                                                    0] ==
                                                                "Fire"
                                                            ? Colors.redAccent
                                                            : PokemonData[index]
                                                                            .typeofpokemon[
                                                                        0] ==
                                                                    "Water"
                                                                ? Colors.blue
                                                                : PokemonData[index].typeofpokemon[
                                                                            0] ==
                                                                        "Poison"
                                                                    ? Colors
                                                                        .deepPurpleAccent
                                                                    : PokemonData[index].typeofpokemon[0] ==
                                                                            "Fighting"
                                                                        ? Colors
                                                                            .orange
                                                                        : PokemonData[index].typeofpokemon[0] == "Bug"
                                                                            ? Colors.lightGreenAccent
                                                                            : PokemonData[index].typeofpokemon[0] == "Electric"
                                                                                ? Colors.amber
                                                                                : PokemonData[index].typeofpokemon[0] == "Rock"
                                                                                    ? Colors.grey
                                                                                    : PokemonData[index].typeofpokemon[0] == "Ground"
                                                                                        ? Colors.brown
                                                                                        : PokemonData[index].typeofpokemon[0] == "Psychic"
                                                                                            ? Colors.indigo
                                                                                            : PokemonData[index].typeofpokemon[0] == "Ghost"
                                                                                                ? Colors.deepPurple
                                                                                                : PokemonData[index].typeofpokemon[0] == "Normal"
                                                                                                    ? Colors.grey
                                                                                                    : Colors.pink,
                                                  )));
                                    },
                                  ),
                                );
                              }))
                      : const Center(
                          child: CircularProgressIndicator(),
                        )
                ],
              ),
            ),
          ]);
        }
        if (state is PokemonErrorState) {
          return Center(
            child: Text("Error ${state.error}"),
          );
        }
        return const Text("Hello World");
      },
    ));
  }

// Function to fetch data from api end point to get all pokemon info
// void fetchPokemonData() {
//   var url = Uri.https("gist.githubusercontent.com",
//       "/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json");
//   http.get(url).then((response) {
//     if (response.statusCode == 200) {
//       var decodedResponse = jsonDecode(response.body);
//       setState(() {
//         PokemonData = decodedResponse;
//       });
//     }
//   }).catchError((e) {
//     print(e);
//   });
// }
}
