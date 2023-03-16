import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokenmon_mobile_app/widgets/app_text.dart';
import 'package:pokenmon_mobile_app/widgets/pokemon_info_text.dart';

class DetailScreen extends StatefulWidget {
  final pokemonIndex;
  final pokemonInfo;
  final Color color;

  const DetailScreen(
      {Key? key, this.pokemonIndex, this.pokemonInfo, required this.color})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.pokemonInfo);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Icon Back to home screen
          Positioned(
              top: 20,
              left: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              )),

          // Pokemon Name and ID
          Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.pokemonInfo.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.pokemonInfo.id,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.right,
                  )
                ],
              )),

          // Pokemon Type
          Positioned(
              top: 130,
              left: 20,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    widget.pokemonInfo.typeofpokemon.join(', '),
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              )),

          // Pokemon ball Background
          Positioned(
            top: height * 0.25,
            right: -20,
            child: Opacity(
                opacity: 0.25,
                child: Image.asset("images/pokemon-ball.png",
                    height: 150, fit: BoxFit.fitHeight)),
          ),

          // Pokemon Detail Info
          Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        PokemonInfo(textProperty: "Name", textValue: widget.pokemonInfo.name),
                        PokemonInfo(textProperty: "Description", textValue: widget.pokemonInfo.xdescription),
                        PokemonInfo(textProperty: "Height", textValue: widget.pokemonInfo.height),
                        PokemonInfo(textProperty: "Category", textValue: widget.pokemonInfo.category),
                        PokemonInfo(textProperty: "Weight", textValue: widget.pokemonInfo.weight),
                        PokemonInfo(textProperty: "Speed", textValue: widget.pokemonInfo.speed.toString()),
                        PokemonInfo(textProperty: "HP", textValue: widget.pokemonInfo.hp.toString()),
                        PokemonInfo(textProperty: "Attack", textValue: widget.pokemonInfo.attack.toString()),
                        PokemonInfo(textProperty: "Defense", textValue: widget.pokemonInfo.defense.toString()),
                        PokemonInfo(textProperty: "Weaknesses", textValue: widget.pokemonInfo.weaknesses.join(',  ')),
                        PokemonInfo(textProperty: "Evolutions", textValue: widget.pokemonInfo.evolutions.join(',  ')),
                        PokemonInfo(textProperty: "Abilities", textValue: widget.pokemonInfo.abilities.join(',  ')),
                        PokemonInfo(textProperty: "Special\nAttack", textValue: widget.pokemonInfo.special_attack.toString()),
                        PokemonInfo(textProperty: "Special\nDefense", textValue: widget.pokemonInfo.special_defense.toString()),
                        PokemonInfo(textProperty: "Total", textValue: widget.pokemonInfo.total.toString()),
                        PokemonInfo(textProperty: "Male\npercentage", textValue: widget.pokemonInfo.male_percentage),
                        PokemonInfo(textProperty: "Female\npercentage", textValue: widget.pokemonInfo.female_percentage),
                        PokemonInfo(textProperty: "Egg Groups", textValue: widget.pokemonInfo.egg_groups),
                        PokemonInfo(textProperty: "Evolved From", textValue: widget.pokemonInfo.evolvedfrom),
                        PokemonInfo(textProperty: "Base Exp", textValue: widget.pokemonInfo.base_exp),
                      ],
                    ),
                  ),
                ),
              )),

          // Pokemon Image
          Positioned(
            top: height * 0.2,
            left: width / 2 - 100,
            child: Hero(
              tag: widget.pokemonIndex,
              child: CachedNetworkImage(
                height: 180,
                width: 180,
                imageUrl: widget.pokemonInfo.imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
