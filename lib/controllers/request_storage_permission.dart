import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermissions() async {
  if (Platform.isAndroid) {
    if (await Permission.manageExternalStorage.isGranted) {
      return true;
    }
    if (await Permission.storage.request().isGranted) {
      return true;
    }
    if (await Permission.manageExternalStorage.request().isGranted) {
      return true;
    }
    if (await Permission.manageExternalStorage.isPermanentlyDenied ||
        await Permission.storage.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false; // Permission denied
  }
  return true;
}
