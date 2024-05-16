import 'package:flutter/material.dart';
import 'package:pageview/multiple_card_flow/place.dart';
import 'city_widget.dart';
import 'review_widget.dart';

class CityItemWidget extends StatelessWidget {
  final City city;
  final VoidCallback onSwipe;
  const CityItemWidget({super.key, required this.city, required this.onSwipe});

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0);
    final subtitleStyle = TextStyle(
        color: Colors.grey[400], fontWeight: FontWeight.w600, fontSize: 17.0);
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! < -7) {
          onSwipe();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: CityWidget(
                    city: city,
                    titleStyle: titleStyle,
                    subtitleStyle: subtitleStyle)),
            const Spacer(),
            Expanded(
                flex: 4,
                child: ReviewWidget(
                  review: city.reviews.first,
                )),
          ],
        ),
      ),
    );
  }
}
