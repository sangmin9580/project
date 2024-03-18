import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project/feature/video/video_post.dart';

class VideotimelineScreen extends ConsumerStatefulWidget {
  const VideotimelineScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideotimelineScreenState();
}

class _VideotimelineScreenState extends ConsumerState<VideotimelineScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.linear,
    );
  }

  void _onVideoFinished() {
    return;
    // _pageController.nextPage(
    //   duration: const Duration(
    //     milliseconds: 300,
    //   ),
    //   curve: Curves.linear,
    // );
  }

  Future<void> _onRefresh() async {
    return Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (BuildContext context, int index) {
                return VideoPost(
                  onVideoFinished: _onVideoFinished,
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
