import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/feature/video/constants/video_comments_icon.dart';
import 'package:project/feature/video/video_comment.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends ConsumerStatefulWidget {
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPostState();

  final Function onVideoFinished;
  final int index;
}

class _VideoPostState extends ConsumerState<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset(
    "asset/videos/video.mp4",
  );

  late final AnimationController _animationController;

  bool _isVideoFinished = false;
  bool _isPlayed = false;
  final Duration _duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _initVideo();
    _animationController = AnimationController(
      vsync: this,
      upperBound: 1.5,
      lowerBound: 1.0,
      value: 1.0,
      duration: _duration,
    );
  }

  Future<void> _initVideo() async {
    await _videoPlayerController.initialize();

    await _videoPlayerController.play();
    await _videoPlayerController.setLooping(true);

    setState(() {});
    _videoPlayerController.addListener(() {
      _onVideoChanged();
    });
  }

  void _onVideoChanged() {
    if (_videoPlayerController.value.isInitialized && !_isVideoFinished) {
      // 비디오의 재생 위치가 전체 재생 시간과 매우 가까운지 확인
      final bool isAlmostFinished = (_videoPlayerController.value.duration -
                  _videoPlayerController.value.position)
              .inSeconds <
          1; // 1초 미만 차이로 간주
      if (isAlmostFinished) {
        _isVideoFinished = true; // 비디오가 끝났음을 표시
        widget.onVideoFinished();
      }
    }

    // if (_videoPlayerController.value.isInitialized) {
    //   if (_videoPlayerController.value.duration ==
    //       _videoPlayerController.value.position) {
    //     widget.onVideoFinished();
    //   }
    // }
  }

  void _onTapVideo() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
        _animationController.reverse();
      } else {
        _videoPlayerController.play();
        _animationController.forward();
      }
      setState(() {
        _isPlayed = !_isPlayed;
      });
    }
  }

  void _onVisibilityChanged(VisibilityInfo visibilityInfo) {
    var visiblePercentage = visibilityInfo.visibleFraction * 100;
    if (!mounted) return;

    if (visiblePercentage == 100 &&
        !_videoPlayerController.value.isPlaying &&
        !_isPlayed) {
      _videoPlayerController.play();
    }
  }

  List<Map<String, dynamic>> videoIcons = [
    {
      "icon": FontAwesomeIcons.solidHeart,
      "text": "2.9M",
    },
    {
      "icon": FontAwesomeIcons.message,
      "text": "33.0K",
    },
    {
      "icon": FontAwesomeIcons.share,
      "text": "Share",
    },
  ];

  Future<void> _onCommetsTap() async {
    if (_videoPlayerController.value.isPlaying) {
      _onTapVideo();
    }
    await showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) => const VideoComment(),
    );
    print("show modal");
    _onTapVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapVideo,
      child: VisibilityDetector(
        onVisibilityChanged: _onVisibilityChanged,
        key: Key("${widget.index}"),
        child: Stack(
          children: [
            Positioned.fill(
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : const Center(
                      child: Text("isinitializing"),
                    ),
            ),
            Positioned.fill(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPlayed ? 1 : 0,
                    duration: _duration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 40,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    child: Text("상민"),
                  ),
                  Gaps.v32,
                  for (var icon in videoIcons)
                    VideoIcons(
                      icon: icon['icon'],
                      text: icon['text'],
                      ontap: _onCommetsTap,
                    ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("@gmapsfun"),
                    Gaps.v5,
                    const Text(
                      "This is actually the place",
                    ),
                    Gaps.v5,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Text(
                        "lasjfkddfadsdfsdfadadssdssfsdasfdfskjdfkljl",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
