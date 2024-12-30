import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final Uri videoUrl;

  const CustomVideoPlayer({super.key, required this.videoUrl});

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false); // اگر می‌خواهید ویدیو تکرار شود
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio/0.3 ,
                child: VideoPlayer(_controller),
              ),
              VideoProgressIndicator(_controller,
                  allowScrubbing: true,
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
                  // استفاده از رنگ‌های پیش‌فرض
                  colors: const VideoProgressColors(
                    playedColor: AppColors.primaryDefaultS,
                    bufferedColor: Colors.grey,
                    backgroundColor: Colors.black12,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                ],
              ),
            ],
          );
        } else {
          return Center(
            child: LoadingAnimationWidget.progressiveDots(
              color: AppColors.primaryDefaultS,
              size: 50,
            ),
          );
        }
      },
    );
  }
}
