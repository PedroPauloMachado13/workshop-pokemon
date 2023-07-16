part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonSuccess extends PokemonState {
  final List<Pokemon> pokeList;
  PokemonSuccess({required this.pokeList});
}

class PokemonError extends PokemonState {
  final String message;
  PokemonError({required this.message});
}
