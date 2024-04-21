import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageGalleryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageGalleryPage extends StatefulWidget {
  @override
  _ImageGalleryPageState createState() => _ImageGalleryPageState();
}

class _ImageGalleryPageState extends State<ImageGalleryPage> {
  TextEditingController _nameController = TextEditingController();
  String _userName = '';
  int _selectedRadio = 0;
  Uint8List? loadedImage;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _nameController.text = _userName;
    });
  }

  Future<void> _saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveImageToGallery() async {
    if (_imageFile != null) {
      await GallerySaver.saveImage(_imageFile!.path).then((bool? success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(success == true ? 'Image Saved to Gallery' : 'Failed to Save Image')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No Image to Save')),
      );
    }
  }

  Future<void> _saveAssetImageToGallery(String assetPath) async {
    final ByteData byteData = await rootBundle.load(assetPath);
    final List<int> bytes = byteData.buffer.asUint8List();

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = '${tempDir.path}/temp_image.jpeg';
    await File(tempPath).writeAsBytes(bytes);

    await GallerySaver.saveImage(tempPath).then((bool? success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(success == true ? 'Asset Image Saved to Gallery' : 'Failed to Save Asset Image')),
      );
    });

    await File(tempPath).delete();
  }

  Future<void> _loadImage() async {
    final byteData = await rootBundle.load('assets/image.jpeg');
    setState(() {
      loadedImage = byteData.buffer.asUint8List();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery App')),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _userName = value;
                      _saveUserName(value); // Save the name whenever it changes
                    });
                  },
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Hello $_userName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              if (_imageFile != null) Image.file(_imageFile!),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: _pickImageFromGallery,
                      child: Text('Load Gallery Image'),
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: _saveImageToGallery,
                      child: Text('Save Gallery Image'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (loadedImage != null) Image.memory(loadedImage!),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: _loadImage,
                      child: Text('Load Asset Image'),
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () => _saveAssetImageToGallery('assets/image.jpeg'),
                      child: Text('Save Asset Image'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
