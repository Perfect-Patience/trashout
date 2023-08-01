import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RecycleIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Change app bar color to white
        iconTheme: IconThemeData(
            color: Colors.black), // Change back button and icon color to black
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search', // Placeholder text for the search bar
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor:
                Colors.white, // Change the background color of the search bar
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25), // Curved border
              borderSide: BorderSide.none,
            ),
            prefixIcon:
                Icon(Icons.search, color: Colors.black), // Search icon color
          ),
          onSubmitted: (value) {
            // Perform search action here
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with your video data length
              itemBuilder: (context, index) {
                return VideoCard(
                  videoTitle: 'Video Title $index',
                  videoUrl:
                      'https://yourvideo.com/$index', // Replace with your video URLs
                  views: 1000 + index * 50, // Replace with the number of views
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final String videoTitle;
  final String videoUrl;
  final int views;

  VideoCard(
      {required this.videoTitle, required this.videoUrl, required this.views});

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : Container(color: Colors.grey[300]),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.videoTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '${widget.views} views',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
