import 'dart:convert';
import "package:http/http.dart" as http;
import 'character.dart';

class GotApi {
  static const String url = 'https://thronesapi.com/api/v2/Characters';

  static Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((character) => Character.fromJson(character)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
