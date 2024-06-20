import 'package:flutter/material.dart';
import 'character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  const CharacterDetailPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                character.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              character.fullName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              character.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontStyle: FontStyle.italic,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 20),
            Text(
              'Family:',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              character.family,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
