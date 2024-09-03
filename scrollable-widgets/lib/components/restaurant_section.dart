import 'package:flutter/material.dart';

import '../models/restaurant.dart';
import 'restaurant_landscape_card.dart';

class RestaurantSection extends StatelessWidget {
  const RestaurantSection({
    super.key,
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              'Food near me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 300,
                  child: RestaurantLandscapeCard(
                    restaurant: restaurants[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
