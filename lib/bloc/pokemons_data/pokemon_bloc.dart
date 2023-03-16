import 'package:pokenmon_mobile_app/bloc/pokemons_data/pokemon_event.dart';
import 'package:pokenmon_mobile_app/bloc/pokemons_data/pokemon_state.dart';
import 'package:pokenmon_mobile_app/repository/pokemon_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;
  PokemonBloc(this._pokemonRepository) : super(EmptyInitialPokemon()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(PokemonLoadingState());
      print("You emmited the loading state of fetching Pokemon Data from api");
      try {
        print("try to fetch data from api using function service in repo");
        final pokemons = await _pokemonRepository.getPokemons();
        print("List of Pokemons Data ${pokemons}");
        emit(PokemonLoadedState(pokemons));
        print("Pokemon data is loaded");
      } catch (e) {
        emit(PokemonErrorState(e.toString()));
        print(" Can't fetch data due to some error show on the screen");
      }
      print("You emmited all state of load pokemon data from api");
    });
  }
}
