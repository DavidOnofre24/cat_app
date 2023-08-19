import 'dart:async';
import 'package:cat_app/models/breed.dart';
import 'package:http/http.dart' show Client;

class BreedApi {
  final Client client;
  BreedApi({
    required this.client,
  });

  Future<List<Breed>> fetchBreeds() async {
    final uri = Uri.parse("https://api.thecatapi.com/v1/breeds");
    final response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39",
    });
    if (response.statusCode == 200) {
      return breedFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
