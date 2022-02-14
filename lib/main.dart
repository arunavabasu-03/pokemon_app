import 'package:flutter/material.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models/pokemon.dart';
import 'Widgets/PokemonList.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  void initState() {
    super.initState();
    fetchpokemon();
    setState(() {});
  }

  List<Pokemon> pokemon = [];

  fetchpokemon() async {
    var url = Uri.parse("https://pokedex2.p.rapidapi.com/pokedex/uk");
    var response = await http.get(url, headers: {
      'x-rapidapi-key': 'b82ca1204dmsh1ce5fe0824e9aa1p1b6abfjsn452a952ddf35'
    });

    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      final pokemonresults = pokemonFromJson(response.body);

      pokemon.addAll(pokemonresults);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(primaryColor: Colors.blue, primarySwatch: Colors.amber),
        home: Pokemonlist(pokemon));
  }
}
