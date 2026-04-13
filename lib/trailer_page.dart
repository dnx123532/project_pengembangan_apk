import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPage extends StatefulWidget {
  final String url;

  const TrailerPage({super.key, required this.url});

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.url);

    controller = YoutubePlayerController(
      initialVideoId: videoId ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true, // biar lebih ringan
        enableCaption: false,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // WAJIB biar gak berat
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trailer")),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
          ),

          const SizedBox(height: 20),

          // Tombol play manual (biar gak auto loading berat)
          ElevatedButton(
            onPressed: () {
              controller.play();
            },
            child: const Text("Play Trailer"),
          ),
        ],
      ),
    );
  }
}
