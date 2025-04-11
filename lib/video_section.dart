import 'dart:ui' as ui;
import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({super.key});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late Widget _iframeWidget;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // Register the iframe view
      const String viewId = 'youtube-video';
      // Replace with your YouTube video ID
      const String videoId = 'R8OejFuUYqo'; // example video ID

      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
        final iframe = IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..src = 'https://www.youtube.com/embed/R8OejFuUYqo?autoplay=1&mute=1&enablejsapi=1&controls=1'
          ..style.border = 'none'
          ..allow = 'autoplay; fullscreen';

        return iframe;
      });

      _iframeWidget = HtmlElementView(viewType: viewId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Text(
            'วีดิโอ',
            style: GoogleFonts.prompt(
              color: const Color(0xFF22382C),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn().slideY(),

          const SizedBox(height: 30),

          if (kIsWeb)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _iframeWidget,
            )
          else
            const Text('Video preview only available on web.'),

          const SizedBox(height: 0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '',
              style: GoogleFonts.prompt(
                fontSize: 16,
                color: const Color(0xFF22382C),
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn().slideY(),
          ),
        ],
      ),
    );
  }
}
