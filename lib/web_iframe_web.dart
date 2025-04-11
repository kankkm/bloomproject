// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebIframe extends StatelessWidget {
  final String viewId;
  final String url;

  const WebIframe({super.key, required this.viewId, required this.url});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // ✅ ใช้ registerViewFactory แบบนี้
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
        final iframe = html.IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..src = url
          ..style.border = 'none'
          ..allow = 'autoplay; fullscreen';
        return iframe;
      });

      return HtmlElementView(viewType: viewId);
    } else {
      return const Text('Only available on web');
    }
  }
}
