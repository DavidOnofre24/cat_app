import 'dart:async';
import 'package:cat_app/models/breed.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class BreedApi {
  final Client client;
  BreedApi({
    required this.client,
  });

  Future<List<Breed>> fetchBreeds() async {
    final uri = Uri.parse("https://api.thecatapi.com/v1/breeds");
    final response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "x-api-key":
          "live_rDOTcH0uwiZt6T3jRvZPYFyxJrvpkWAuAq9i09JX1athYBl6FfJI5Taaas29p9aD",
    });
    if (response.statusCode == 200) {
      return breedFromJson(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }
}
