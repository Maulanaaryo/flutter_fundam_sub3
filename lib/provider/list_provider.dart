// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';

enum ResultState { Loading, Nodata, HasData, Error }

class ListProvider extends ChangeNotifier {
  final ApiService apiService;

  ListProvider({required this.apiService}) {
    fetchListRestaurant();
  }

  Restaurantlist? _restaurantlist;
  ResultState? _state;
  String _message = '';

  Restaurantlist? get result => _restaurantlist;
  ResultState? get state => _state;
  String get message => _message;

  Future<dynamic> fetchListRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.restaurantList();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.Nodata;
        notifyListeners();
        return _message = 'Data not found';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantlist = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
