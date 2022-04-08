import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/ui/restaurant_search_page.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/card_restaurant.dart';
import 'package:restaurant_app/widgets/platform_widgets.dart';

class RestaurantFavoritePage extends StatelessWidget {
  static const String bookmarksTitle = 'Favorites';

  const RestaurantFavoritePage({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.favorite,
          color: Colors.white
        ),
        title: const Text(
          bookmarksTitle,
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff0096ff), Color(0xff6610f2)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RestaurantSearchPage()));
              },
              icon: const Icon(Icons.search, color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(bookmarksTitle),
      ),
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.HasData) {
          return ListView.builder(
            itemCount: provider.bookmarks.length,
            itemBuilder: (context, index) {
              return CardRestaurant(restaurant: provider.bookmarks[index]);
            },
          );
        } else {
          return Center(
            child: Text(provider.message),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
