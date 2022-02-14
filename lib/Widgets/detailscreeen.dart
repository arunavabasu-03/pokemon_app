import 'package:flutter/material.dart';
import 'package:pokemon_app/main.dart';
import 'PokemonList.dart';

class DetailScreen extends StatelessWidget {
   final String name;
   final String url;
  final double width;
  final double height;
  const DetailScreen(
      {Key? key, required this.url, required this.name, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Center(
        child: Column(
          children: [
            Image.network(url),
            Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              width.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              height.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            
          ],
        ),
      )
      );
    
  }
}
