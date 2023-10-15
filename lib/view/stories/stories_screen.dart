import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_project/app/components/atoms/image_shimmer_atom.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';
import 'package:test_project/domain/stories/entities/story_entity.dart';

import 'widgets/atoms/close_story_icon.dart';
import 'widgets/molecules/story_indicator_group_molecule.dart';
import 'widgets/molecules/story_navigation_molecule.dart';
import 'widgets/molecules/story_title_molecule.dart';

class StoriesScreen extends StatefulWidget {
  final List<StoryEntity> stories;
  const StoriesScreen({Key? key, required this.stories}) : super(key: key);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
        if (controller.value > 0.99) {
          if (currentIndex == widget.stories.length - 1) {
            Navigator.pop(context);
          }
          pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        }
      });
    controller.repeat();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          physics: const ClampingScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
            controller.reset();
            controller.repeat();
          },
          children: [
            ...widget.stories.map(
              (storyModel) => Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryColor.withOpacity(0.26),
                          AppColors.primaryColor.withOpacity(0),
                          AppColors.primaryColor.withOpacity(0),
                          AppColors.primaryColor.withOpacity(0.26)
                        ],
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.blackColor.withOpacity(0.4),
                            AppColors.blackColor.withOpacity(0.4)
                          ],
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: storyModel.imgLink,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const ImageShimmerAtom(
                            isCircle: false,
                            size: 0,
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              FlutterRemix.image_line,
                              color: AppColors.blackColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  StoryTitle(
                    storyModel: storyModel,
                  ),
                  StoryNavigationMolecule(pageController: pageController),
                  const Positioned(
                    right: 16,
                    top: 48,
                    child: CloseStoryIcon(),
                  ),
                ],
              ),
            )
          ],
        ),
        StoryIndicatorGroup(
          count: widget.stories.length,
          currentIndex: currentIndex,
          controller: controller,
        ),
      ],
    ));
  }
}
