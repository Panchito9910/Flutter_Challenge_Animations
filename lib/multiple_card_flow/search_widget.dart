import 'package:flutter/material.dart';

class SearchWidget extends AnimatedWidget {
  const SearchWidget(AnimationController animation, {super.key})
      : super(listenable: animation);
  get animation => listenable;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final value = 1 - animation.value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: size.width * value,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xFF8E9BB5),
                    borderRadius: BorderRadius.circular(20)),
                child: value > 0.4
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.search),
                            Expanded(
                              child: Text(
                                "Search city ...",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () => {}, icon: const Icon(Icons.settings_applications)),
      ],
    );
  }
}
