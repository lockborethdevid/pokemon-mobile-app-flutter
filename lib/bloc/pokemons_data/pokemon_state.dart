import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/pokemon_response.dart';

@immutable
abstract class PokemonState extends Equatable {}

// When the app initialize empty value of state
class EmptyInitialPokemon extends PokemonState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// data loading state
class PokemonLoadingState extends PokemonState {
  @override
  List<Object?> get props => [];
}

// data loaded state
class PokemonLoadedState extends PokemonState {
  PokemonLoadedState(this.pokemons);
  final List<PokenmonList> pokemons;
  @override
  List<Object?> get props => [pokemons];
}

// data error loading state
class PokemonErrorState extends PokemonState {
  PokemonErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
