import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    //https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  void playPauseButton(){
    setState(() {
      _controller.value.isPlaying
          ? _controller.pause()
          : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: _controller.value.isInitialized
                  ?
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                  : Container(),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  Duration currentPosition = _controller.value.position;
                  Duration targetPosition = currentPosition - const Duration(seconds: 10);
                  _controller.seekTo(targetPosition);
                }, icon: Icon(Icons.keyboard_double_arrow_left)),

                IconButton(onPressed: playPauseButton, icon: _controller.value.isPlaying? const Icon(Icons.pause): const Icon(Icons.play_arrow)),

                IconButton(onPressed: (){
                  Duration currentPosition = _controller.value.position;
                  Duration targetPosition = currentPosition + const Duration(seconds: 10);
                  _controller.seekTo(targetPosition);
                }, icon: Icon(Icons.keyboard_double_arrow_right)),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: playPauseButton,
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
