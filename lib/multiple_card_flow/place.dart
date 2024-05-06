class City {
  const City({
    required this.name,
    required this.price,
    required this.place,
    required this.date,
    required this.image,
    required this.reviews,
  });
  final String name;
  final String price;
  final String place;
  final String date;
  final String image;
  final List<CityReview> reviews;
}

class CityReview {
  const CityReview({
    required this.avatar,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });
  final String avatar;
  final DateTime date;
  final String title;
  final String subtitle;
  final String description;
  final String image;
}

final cities = <City>[
  City(
      name: "Tokyo",
      price: "580USD",
      place: "Cyberpunk",
      date: "2015/03/22",
      image: "assets/images/tokyo.png",
      reviews: [
        CityReview(
            avatar: "assets/images/you.png",
            date: DateTime(2015, 03, 22, 7, 0, 0),
            title: "Asakusa a district of Taito",
            subtitle: "We travel not to escape life ...",
            description:
                "Asakusa retains the essence of an older Tokyo, with traditional crafts shops and street food stails on Nakamise Street ...",
            image: "assets/images/tokyo_review.jpg")
      ]),
  City(
      name: "New York",
      price: "470USD",
      place: "Empire State",
      date: "2016/09/17",
      image: "assets/images/newyork.jpg",
      reviews: [
        CityReview(
            avatar: "assets/images/yoshiko.jpg",
            date: DateTime(2016, 09, 17, 7, 0, 0),
            title: "Broad, wholesome, charitable",
            subtitle: "We travel not to escape life ...",
            description:
                "Broad, wholesome, charitable views of men and things cannot be acquired by vegetating in one lift",
            image: "assets/images/newyork_review.jpg")
      ]),
  City(
      name: "Paris",
      price: "470USD",
      place: "The Eiffel Tower",
      date: "2016/09/07",
      image: "assets/images/paris.jpg",
      reviews: [
        CityReview(
            avatar: "assets/images/hanamaru.jpg",
            date: DateTime(2016, 09, 17, 7, 0, 0),
            title: "Vajrasana retreat centre view",
            subtitle: "Waisham-le-Willows",
            description:
                "It is architecture that fades into the back-round, allowing your mind to concentrate on higer",
            image: "assets/images/paris_review.jpg")
      ]),
  City(
      name: "Italy",
      price: "830USD",
      place: "Rome Coliseum",
      date: "2014/08/08",
      image: "assets/images/italy.jpg",
      reviews: [
        CityReview(
            avatar: "assets/images/dia.jpg",
            date: DateTime(2014, 08, 08, 7, 0, 0),
            title: "Manarola is a small town",
            subtitle: "We travel not to escape life ...",
            description:
                "Manarola primary industries have traditionally been fishing and viticulture.",
            image: "assets/images/italy_review.jpg")
      ]),
];
