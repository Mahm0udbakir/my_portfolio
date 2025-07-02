import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

Future<bool> launchExternalUrl(String url) async {
  try {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(
        uri, 
        mode: LaunchMode.externalApplication,
      );
    }
    // Log when URL cannot be launched
    debugPrint('Cannot launch URL: $url');
    return false;
  } catch (e) {
    // Log error with more context
    debugPrint('Failed to launch URL: $url. Error: $e');
    return false;
  }
} 