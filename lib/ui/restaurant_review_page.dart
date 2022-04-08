import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';

class RestaurantReview extends StatelessWidget {
  final Restaurant restaurant;
  // ignore: use_key_in_widget_constructors
  const RestaurantReview({Key? key, required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Pelanggan Restaurant'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff0096ff), Color(0xff6610f2)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: restaurant.customerReviews.length,
          itemBuilder: (context, index) {
            final listReview = restaurant.customerReviews[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person_pin,
                        size: 25.0,
                      ),
                      Text(
                        listReview.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(' || '),
                      Text(
                        listReview.date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Text(' || '),
                    ],
                  ),
                  Text(
                    listReview.review,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
