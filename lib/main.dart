import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tktok_clone/config/theme/app_theme.dart';
import 'package:tktok_clone/infrastructure/datasources/local_videos_datasources_impl.dart';
import 'package:tktok_clone/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tktok_clone/presentation/providers/discover_provider.dart';
import 'package:tktok_clone/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDataSource: LocalVideoDataSource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tktok',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
