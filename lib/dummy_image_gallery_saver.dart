// lib/dummy_image_gallery_saver.dart
class ImageGallerySaver {
  static Future<Map<String, dynamic>> saveImage(Uint8List imgBytes, {int quality = 80, String name = "image"}) async {
    return {'isSuccess': false, 'filePath': null};
  }
}
