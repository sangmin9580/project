import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/video/constants/video_comments_icon.dart';

class VideoComment extends ConsumerStatefulWidget {
  const VideoComment({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoCommentState();
}

class _VideoCommentState extends ConsumerState<VideoComment> {
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  bool isWriting = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: GestureDetector(
        onTap: _onScaffoldTap,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "22796 comments",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            actions: const [
              CloseButton(),
            ],
          ),
          body: Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(),
                itemBuilder: (context, index) {
                  return const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: Sizes.size10,
                          left: Sizes.size10,
                        ),
                        child: CircleAvatar(
                          child: Text("상민"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(
                            left: Sizes.size5,
                            right: Sizes.size10,
                          ),
                          title: Text("gmaosfun"),
                          subtitle: Text(
                              "Location : Wharariki Beach, New ZealandZealandZealandZealandZealand"),
                          trailing: VideoIcons(
                            icon: FontAwesomeIcons.heart,
                            text: "31.9K",
                            size: Sizes.size28,
                            hasGap: false,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: BottomAppBar(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const TextField(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
