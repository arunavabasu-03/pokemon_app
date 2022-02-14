import 'package:flutter/material.dart';
import 'package:pokemon_app/Models/pokemon.dart';

import 'detailscreeen.dart';


class Pokemonlist extends StatelessWidget {
  List<Pokemon> ?_pokemon = [];
  Pokemonlist(this._pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: GridView.builder(
        itemCount: _pokemon?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                       url: _pokemon![index].thumbnailImage,
                        height: _pokemon![index].height,
                        name: _pokemon![index].name,
                        width: _pokemon![index].weight),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(_pokemon![index].thumbnailImage),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Text(
                _pokemon![index].name,
                textAlign: TextAlign.center,
              )
            ],
          );
          // Text(_pokemon[index].name)
        },
      ),
    );
  }
}
