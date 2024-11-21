import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future downloadImage(BuildContext context, String imageUrl) async {
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content:
              Text('Storage permissions are required to download images.')),
    );
    return;
  }

  try {
    if (imageUrl.isEmpty) {
      throw Exception('Invalid image URL');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Downloading image...')),
    );

    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode != 200) {
      throw Exception('Failed to download image: ${response.statusCode}');
    }

    Directory downloadsDir;
    if (Platform.isAndroid) {
      downloadsDir = Directory('/storage/emulated/0/Download');
      if (!await downloadsDir.exists()) {
        downloadsDir =
            await getExternalStorageDirectory() ?? Directory.systemTemp;
      }
    } else {
      downloadsDir = await getApplicationDocumentsDirectory();
    }

    final fileName = 'ComfyWall_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final filePath = '${downloadsDir.path}/$fileName';

    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Image saved to $filePath')),
    );
  } catch (e) {
    print('Download failed: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Download failed: ${e.toString()}')),
    );
  }
}
