import 'dart:convert';
import 'dart:io';
import 'package:workshop_teste/pokemon/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  static Future<List<Pokemon>> fetchPokemonList() async {
    try {
      final resp = await http.get(
        Uri.parse('http://jsonkeeper.com/b/GXGP'),
      );

      final Map<String, dynamic> decoded = jsonDecode(resp.body);

      if (resp.statusCode == 200) {
        final pokeResp = PokemonResponse.fromJson(decoded);
        return pokeResp.data;
      } else {
        throw Exception('Failed to load pokemon list');
      }
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
