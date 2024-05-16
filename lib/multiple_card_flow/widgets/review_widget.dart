import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pageview/multiple_card_flow/place.dart';

class ReviewWidget extends StatelessWidget {
  final CityReview review;
  final DateFormat format = DateFormat.yMEd();
  ReviewWidget({
    super.key,
    required this.review,
  });
  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(
      height: 10.0,
    );
    return Hero(
      tag: "review_${review.title}",
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(review.avatar),
                  ),
                  separator,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          separator,
                          Text(
                            review.title,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12.0),
                          ),
                          Text(format.format(review.date),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 12.0)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              separator,
              Text(
                review.subtitle,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0),
              ),
              separator,
              Text(
                review.description,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0),
              ),
              separator,
              Expanded(
                child: Image.asset(
                  review.image,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
