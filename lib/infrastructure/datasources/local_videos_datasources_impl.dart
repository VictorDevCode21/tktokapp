import 'package:tktok_clone/domain/datasources/video_posts_datasource.dart';
import 'package:tktok_clone/domain/entities/video_post.dart';
import 'package:tktok_clone/infrastructure/models/local_video_model.dart';
import 'package:tktok_clone/shared/data/local_video_posts.dart';

class LocalVideoDataSource implements VideoPostDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
