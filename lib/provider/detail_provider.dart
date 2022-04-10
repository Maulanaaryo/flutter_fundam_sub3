// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';


class DetailProvider extends ChangeNotifier {
  final ApiService apiDetailService;
  final String id;

  DetailProvider({required this.apiDetailService, required this.id}) {
    _fetchDetailRestaurant(id);
  }

  Restaurantdetail? _restaurantdetail;
  ResultState? _state;
  String _message = '';

  Restaurantdetail? get result => _restaurantdetail;
  ResultState? get state => _state;
  String get message => _message;

  Future<dynamic> _fetchDetailRestaurant(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantDetail = await apiDetailService.restaurantDetail(id);
      if (restaurantDetail.restaurant.id.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Data no found';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantdetail = restaurantDetail;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
