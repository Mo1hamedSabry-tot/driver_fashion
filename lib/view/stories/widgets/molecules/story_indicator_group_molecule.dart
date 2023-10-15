import 'package:flutter/material.dart';

import '../atoms/story_indicator_atom.dart';

class StoryIndicatorGroup extends StatelessWidget {
  const StoryIndicatorGroup({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.controller,
  });

  // final StoriesScreen widget;
  final int count;
  final int currentIndex;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Container(
          height: 4,
          width: 400, //MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: count,
              itemBuilder: (context, index) {
                return StoryIndicator(
                    width: 323 / count,
                    index: index,
                    currentIndex: currentIndex,
                    controller: controller);
              }),
        ),
      ),
    );
  }
}
