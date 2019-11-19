import 'package:http/http.dart' as http;
import '../models/item_model.dart';
import 'dart:convert';

class ApiProvider {
  List<Welcome> _dd = List<Welcome>();
  Future<List<Welcome>> fetchNotes() async {
    final response =
        await http.get('https://demo3826367.mockable.io/https://gist.github.com/agubha/4ba875b16d463c3167bd6760d4749ed1%3Ffbclid=IwAR3XfUfUv-WDQ0MYxHGSReeMjF24niXcuPNqCRMnttfaD56dpCRbEdkNWLw');

//List<Welcome> welcomeFromJson(response) {
    List<Welcome> dd = new List<Welcome>();
    final jsonResponse = json.decode(response.body);
       print(jsonResponse);
    dd = List<Welcome>.from(jsonResponse.map((x) => Welcome.fromJson(x)));

    return dd;
  }
}