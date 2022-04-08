import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/constant.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const CardRestaurant({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(restaurant.id),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Hero(
                  tag: restaurant.pictureId,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      Constant.baseUrl + 'images/small/' + restaurant.pictureId,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                title: Text(
                  restaurant.name,
                ),
                subtitle: Text(restaurant.city),
                trailing: isBookmarked
                    ? IconButton(
                        icon: const Icon(Icons.favorite),
                        color: favoriteColor,
                        onPressed: () => provider.removeBookmark(restaurant.id),
                      )
                    : IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: favoriteColor,
                        onPressed: () => provider.addBookmark(restaurant),
                      ),
                onTap: () => Navigator.pushNamed(
                    context, RestaurantDetailPage.routeName,
                    arguments: restaurant.id),
              ),
            );
          },
        );
      },
    );
  }
}
