// web_iframe_web.dart
import 'dart:ui' as ui;
import 'dart:html';
import 'package:flutter/widgets.dart';

Widget buildWebView(String viewId, String url) {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
    final iframe = IFrameElement()
      ..width = '100%'
      ..height = '100%'
      ..src = url
      ..style.border = 'none'
      ..allow = 'autoplay; fullscreen';
    return iframe;
  });

  return HtmlElementView(viewType: viewId);
}