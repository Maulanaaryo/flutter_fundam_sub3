import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/ui/restaurant_review_page.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  const DetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff0096ff), Color(0xff6610f2)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/medium/" +
                        restaurant.pictureId,
                        ),
                        ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      restaurant.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text('${restaurant.rating}')
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      Text('${restaurant.address}' ', ' '${restaurant.city}'),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Text(restaurant.description),
                  const Divider(color: Colors.grey),
                  const Center(
                    child: Text(
                      '~ Menu Restaurant ~',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  const Text(
                    'Makanan',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Divider(color: Colors.grey),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.menus.foods
                          .map((food) => Text('- ${food.name} '))
                          .toList(),
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  const Text(
                    'Minuman',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Divider(color: Colors.grey),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.menus.drinks
                          .map((drink) => Text('- ${drink.name} '))
                          .toList(),
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xff0096ff),
                                        Color(0xff6610f2)
                                      ],
                                      begin: FractionalOffset.topLeft,
                                      end: FractionalOffset.bottomRight),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 16),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RestaurantReview(
                                            restaurant: restaurant,
                                          ))),
                              child: const Text('Reviews'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
