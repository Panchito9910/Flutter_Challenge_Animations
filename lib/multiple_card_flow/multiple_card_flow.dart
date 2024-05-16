import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:pageview/multiple_card_flow/multiple_card_flow_details.dart";
import "package:pageview/multiple_card_flow/place.dart";
// ignore: depend_on_referenced_packages
import "package:vector_math/vector_math_64.dart" as vector;
import 'widgets/city_item_widget.dart';
import 'widgets/search_widget.dart';

const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF4b6089),
      Color(0xFF9FB4D2),
    ]);

class MultipleCardFlow extends StatefulWidget {
  const MultipleCardFlow({super.key});
  @override
  State<MultipleCardFlow> createState() => _MultipleCardFlowState();
}

class _MultipleCardFlowState extends State<MultipleCardFlow>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController(viewportFraction: 0.8);
  AnimationController? _animationController;
  double? page = 0.0;
  @override
  void initState() {
    _pageController.addListener(listenScroll);
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _pageController.removeListener(listenScroll);
    _pageController.dispose();
    super.dispose();
  }

  void listenScroll() {
    setState(() {
      page = _pageController.page;
    });
  }

  void onSwipe(City city) async {
    _animationController?.forward();
    await Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 900),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
              opacity: animation, child: MultipleCardFlowDetails(city: city));
        }));
    _animationController?.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Positioned.fill(
        child: DecoratedBox(
            decoration: BoxDecoration(gradient: backgroundGradient)),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SearchWidget(_animationController!),
              ),
              Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      final city = cities[index];
                      final p = (page! - index).abs().clamp(0.0, 1.0);
                      final position =
                          _pageController.position.userScrollDirection ==
                                  ScrollDirection.forward
                              ? 1.0
                              : -1.0;
                      final opacity = p.clamp(0.0, 0.7);
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(vector.radians(45 * p * position)),
                        child: Opacity(
                          opacity: 1 - opacity,
                          child: CityItemWidget(
                            city: city,
                            onSwipe: () {
                              onSwipe(city);
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
