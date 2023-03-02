import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokenmon_mobile_app/pages/pokemon_info_screen.dart';
import 'package:pokenmon_mobile_app/pages/search_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Store List of Pokemon Info
  late List PokemonData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    Icon customIcon = const Icon(Icons.search);
    Widget customSearchBar = const Text('Search Pokemon by Name');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Pokemon by Name'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: const Icon(Icons.search),
            )
          ],
          // centerTitle: true,
        ),
      // backgroundColor: Colors.black,
        body: Stack(
            children: [
              // Background Image
              Positioned(
                top: 25,
                right: 10,
                child: Image.asset('images/pokemon-logo.png',
                  width: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),

              // Home Screen Title
              Positioned(
                  top: 30,
                  left: 20,
                  child: Text("POKEMON GO \nCatch Y'all", style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),)
              ),

              // List of Pokemon Info Cards
              Positioned(
                top: 180,
                bottom: 0,
                width: width,
                child: Column(
                  children: [
                    PokemonData.isNotEmpty ? Expanded(
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.4
                            ),
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics()
                            ,
                            itemCount: PokemonData.length,
                            itemBuilder: (context, index) {
                              final List<
                                  dynamic> TypeList = PokemonData[index]["typeofpokemon"];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: InkWell(
                                  child: SafeArea(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.green,
                                          color: PokemonData[index]['typeofpokemon'][0] ==
                                              "Grass"
                                              ? Colors.greenAccent
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Fire" ? Colors.redAccent
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Water"
                                              ? Colors.blue
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Poison" ? Colors.deepPurpleAccent
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Fighting"
                                              ? Colors.orange
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Bug" ? Colors.lightGreenAccent
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Electric"
                                              ? Colors.amber
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Rock" ? Colors.grey
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Ground"
                                              ? Colors.brown
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Psychic" ? Colors.indigo
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Ghost"
                                              ? Colors.deepPurple
                                              : PokemonData[index]['typeofpokemon'][0] ==
                                              "Normal" ? Colors.grey : Colors
                                              .pink,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25))
                                      ),
                                      child: Stack(
                                        children: [
                                          // Pokemon ID
                                          Positioned(right: 15,
                                              top: 10,
                                              child: Text(
                                                PokemonData[index]["id"],
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),)),

                                          // Pokemon Name Section
                                          Positioned(
                                            top: 10,
                                            left: 15,
                                            child: Text(
                                              PokemonData[index]['name'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  shadows: [
                                                    BoxShadow(
                                                        color: Colors.blueGrey,
                                                        offset: Offset(0, 0),
                                                        spreadRadius: 1.0,
                                                        blurRadius: 15
                                                    )
                                                  ]
                                              ),
                                            ),
                                          ),

                                          // Pokemon Type Section
                                          Positioned(
                                            top: 40,
                                            left: 15,
                                            child: Container(
                                              child: Padding(
                                                  padding: const EdgeInsets
                                                      .only(left: 10.0,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Column(
                                                      children: TypeList.map((
                                                          item) =>
                                                          Text(item,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12,
                                                                shadows: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .blueGrey,
                                                                      offset: Offset(
                                                                          0, 0),
                                                                      spreadRadius: 1.0,
                                                                      blurRadius: 15
                                                                  )
                                                                ]
                                                            ),)).toList())
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius
                                                      .all(Radius.circular(20)),
                                                  color: Colors.black
                                                      .withOpacity(0.5)
                                              ),
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
                                                  imageUrl: PokemonData[index]['imageurl'],
                                                  height: 100,
                                                  fit: BoxFit.fitHeight,
                                                  placeholder: (context, url) =>
                                                  const Center(
                                                    child: CircularProgressIndicator(),
                                                  )
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) =>
                                            DetailScreen(pokemonIndex: index,
                                              pokemonInfo: PokemonData[index],
                                              color: PokemonData[index]['typeofpokemon'][0] ==
                                                  "Grass"
                                                  ? Colors.greenAccent
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Fire" ? Colors.redAccent
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Water"
                                                  ? Colors.blue
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Poison" ? Colors
                                                  .deepPurpleAccent
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Fighting"
                                                  ? Colors.orange
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Bug" ? Colors
                                                  .lightGreenAccent
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Electric"
                                                  ? Colors.amber
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Rock" ? Colors.grey
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Ground"
                                                  ? Colors.brown
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Psychic" ? Colors.indigo
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Ghost"
                                                  ? Colors.deepPurple
                                                  : PokemonData[index]['typeofpokemon'][0] ==
                                                  "Normal"
                                                  ? Colors.grey
                                                  : Colors.pink,
                                            )));
                                  },
                                ),
                              );
                            })
                    ) : const Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                ),
              ),
            ]
        )
    );
  }

  // Function to fetch data from api end point to get all pokemon info
  void fetchPokemonData() {
    var url = Uri.https("gist.githubusercontent.com",
        "/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json");
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        setState(() {
          PokemonData = decodedResponse;
        });
      }
    }).catchError((e) {
      print(e);
    });
  }
}
