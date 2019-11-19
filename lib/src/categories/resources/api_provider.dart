import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/item_model.dart';

class ApiProvider {
  Future<List<Welcome>> fetchNotes() async {
    final response = await http.get(
        'https://demo3826367.mockable.io/https://gist.github.com/agubha/4ba875b16d463c3167bd6760d4749ed1%3Ffbclid=IwAR3XfUfUv-WDQ0MYxHGSReeMjF24niXcuPNqCRMnttfaD56dpCRbEdkNWLw');

    List<Welcome> dd = new List<Welcome>();
    final jsonResponse = json.decode(response.body);
    dd = List<Welcome>.from(jsonResponse.map((x) => Welcome.fromJson(x)));
    return dd;
  }
}
