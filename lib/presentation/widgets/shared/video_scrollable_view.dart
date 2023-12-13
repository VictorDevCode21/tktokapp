import 'package:flutter/material.dart';
import 'package:tktok_clone/domain/entities/video_post.dart';
import 'package:tktok_clone/presentation/widgets/shared/video_buttons.dart';
import 'package:tktok_clone/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            // Video Player + gradient
            SizedBox.expand(
              child: FullScreenPlayer(
                  videoUrl: videoPost.videoUrl, caption: videoPost.caption),
            ),

            // Buttons
            Positioned(
                bottom: 100, right: 20, child: VideoButtons(video: videoPost))
          ],
        );
      },
    );
  }
}
