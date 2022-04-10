import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/search_provider.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/card_search.dart';

class RestaurantSearchPage extends StatefulWidget {
  static const routeName = '/restaurant_search';
  const RestaurantSearchPage({Key? key}) : super(key: key);

  @override
  State<RestaurantSearchPage> createState() => _RestaurantSearchPageState();
}

class _RestaurantSearchPageState extends State<RestaurantSearchPage> {
  String queries = '';
  final TextEditingController _searchController = TextEditingController();

  Widget _buildSearch(BuildContext context) {
    return Consumer<SearchRestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result?.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result!.restaurants[index];
              return CardSearch(restaurant: restaurant);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.signal_wifi_connected_no_internet_4_sharp,
                      color: Colors.grey, size: 100),
                  SizedBox(height: 20),
                  Text('Please Check Your Connection.',
                      style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('Restaurant not found'));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchRestaurantProvider(
        apiService: ApiService(Client()),
      ),
      child: Consumer<SearchRestaurantProvider>(builder: (context, state, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search Restaurant', style: TextStyle(color: Colors.white),),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff0096ff), Color(0xff6610f2)],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight),
              ),
            ),
          ),
          body: Stack(
            children: [
              SafeArea(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 16),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: "Pilih restaurant...",
                      ),
                      onChanged: (String value) {
                        setState(() {
                          queries = value;
                        });
                        state.fetchQueryRestaurant(value);
                      },
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: _buildSearch(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
