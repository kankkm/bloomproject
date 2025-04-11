import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

// Import iframe view builder แยกตาม platform
import 'web_iframe_stub.dart'
if (dart.library.html) 'web_iframe_web.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

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
              child: buildWebView(
                'youtube-video',
                'https://www.youtube.com/embed/R8OejFuUYqo?autoplay=1&mute=1&enablejsapi=1&controls=1',
              ),
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
