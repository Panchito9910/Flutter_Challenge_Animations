import 'package:flutter/material.dart';
import 'package:pageview/multiple_card_flow/place.dart';

class CityWidget extends StatelessWidget {
  const CityWidget({
    super.key,
    required this.city,
    required this.titleStyle,
    required this.subtitleStyle,
    this.padding = EdgeInsets.zero,
  });

  final City city;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'city_${city.name}',
      child: Card(
        elevation: 10,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                city.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      city.name,
                      style: titleStyle,
                    ),
                    Text(
                      city.price,
                      style: titleStyle,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Expanded(
                      child: Text(
                        city.place,
                        style: subtitleStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        city.date,
                        style: subtitleStyle.copyWith(fontSize: 15.0, shadows: [
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 10.0,
                            spreadRadius: 10.0,
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
