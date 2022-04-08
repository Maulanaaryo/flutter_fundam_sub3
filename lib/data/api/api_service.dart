import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';
import 'package:restaurant_app/data/model/search_restaurant.dart';
import 'package:http/http.dart' show Client;

class ApiService {
   Client? client;
   ApiService({this.client}){
     client ??= Client();
   }
  final String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<Restaurantlist> restaurantList() async {
    final response = await http.get(Uri.parse(_baseUrl + '/list'));
    if (response.statusCode == 200) {
      return Restaurantlist.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list restaurant');
    }
  }

  Future<Restaurantdetail> restaurantDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + '/detail/$id'));
    if (response.statusCode == 200) {
      return Restaurantdetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail restaurant');
    }
  }

  Future<Restaurantsearch> restaurantSearch(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + '/search?q=$query'));
    if (response.statusCode == 200) {
      return Restaurantsearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search restaurant');
    }
  }
}
