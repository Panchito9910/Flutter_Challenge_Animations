import "package:flutter/material.dart";
import 'package:pageview/multiple_card_flow/widgets/city_widget.dart';
import "package:pageview/multiple_card_flow/multiple_card_flow.dart";
import "package:pageview/multiple_card_flow/place.dart";
import 'package:pageview/multiple_card_flow/widgets/review_widget.dart';

class MultipleCardFlowDetails extends StatelessWidget {
  final City city;
  final titleStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0);
  final subtitleStyle = TextStyle(
      color: Colors.grey[400], fontWeight: FontWeight.w600, fontSize: 17.0);
  MultipleCardFlowDetails({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          const Positioned.fill(
            child: DecoratedBox(
                decoration: BoxDecoration(gradient: backgroundGradient)),
          ),
          Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: CityWidget(
                        city: city,
                        titleStyle: titleStyle,
                        subtitleStyle: subtitleStyle,
                        padding: const EdgeInsets.only(left: 40.0, top: 40))),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: city.reviews.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final review = city.reviews[index];
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ReviewWidget(review: review));
                    },
                  ),
                )
              ],
            ),
          ),
          const Positioned(left: 20, top: 40, child: BackButton())
        ],
      ),
    );
  }
}
