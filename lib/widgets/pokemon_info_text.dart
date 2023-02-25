import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class PokemonInfo extends StatelessWidget {
  final String textProperty;
  final String textValue;
  const PokemonInfo( {Key? key , required this.textProperty , required this.textValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            width: width * 0.25,
            child: Apptext(
                color: Colors.blueGrey,
                text: textProperty,
                size: 13),
          ),
          Container(
            width: width * 0.5,
            child: Apptext(text: textValue, color: Colors.black, size: 13),
          )
        ],
      ),
    );
  }
}
