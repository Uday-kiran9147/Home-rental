import 'dart:io';
import 'package:flutter/material.dart';
import 'package:houserental/widgets/forms/filldetails.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';

class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  List<File> _imageFiles = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final rotatedImage = await FlutterExifRotation.rotateImage(
        path: pickedFile.path,
      );
      setState(() {
        _imageFiles.add(rotatedImage);
      });
    }
  }

  void _clearImages() {
    setState(() {
      _imageFiles.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: _imageFiles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final file = _imageFiles[index];
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Image.file(
                          file,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Image ${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'Size: ${(file.lengthSync() / 1024).toStringAsFixed(2)} KB'),
                      Text(
                          'Dimensions: ${file.readAsBytesSync().length} x ${file.readAsBytesSync().length}'),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: Text('Take a Picture'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: Text('Choose from Gallery'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: _clearImages,
            child: Text('Clear Images'),
          ),
          // ElevatedButton(
          //   onPressed: () => Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => FillHouseDetails(),
          //       )),
          //   child: Text('Fill Details'),
          // ),
        ],
      ),
    );
  }
}
