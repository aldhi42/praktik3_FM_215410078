import 'package:flutter/material.dart';
import 'character.dart';
import 'got_api.dart';
import 'character_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Character>> futureCharacters;

  @override
  void initState() {
    super.initState();
    futureCharacters = GotApi.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Thrones Characters'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Character>>(
        future: futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final charac = characters[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),  
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(charac.imageUrl),
                      ),
                      title: Text(
                        charac.fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(charac.title),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CharacterDetailPage(character: charac),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
