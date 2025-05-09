import 'dart:html';
import 'dart:ui_web' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

// For web platform views
import 'package:flutter/services.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({super.key});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  final String videoId = 'R8OejFuUYqo';
  late Widget _videoWidget;

  @override
  void initState() {
    super.initState();
    _setupVideoPlayer();
  }

  void _setupVideoPlayer() {
    if (kIsWeb) {
      // Use a simpler approach with IFrameElement and DivElement
      final IFrameElement iframeElement = IFrameElement()
        ..src = 'https://www.youtube.com/embed/$videoId?autoplay=1&mute=1&enablejsapi=1&controls=1'
        ..style.border = 'none'
        ..allowFullscreen = true
        ..allow = 'autoplay; fullscreen'
        ..width = '100%'
        ..height = '100%';

      // Wrap in a div for styling
      final divElement = DivElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..append(iframeElement);

      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory('youtube-player-$videoId', (int viewId) => divElement);

      _videoWidget = HtmlElementView(viewType: 'youtube-player-$videoId');
    } else {
      _videoWidget = const Center(child: Text('Video is only available on web platforms'));
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
              child: _videoWidget,
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