// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_field, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  final List<File> imageFiles;
   const ImagePick({
    Key? key,
   required this.imageFiles,
  }) : super(key: key);
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  // List<File> _imageFiles = [];
  void _clearImages() {
    setState(() {
      widget.imageFiles.clear();
    });
  }

  Future<void> _pickImages() async {
    List<XFile>? selectedImages = await ImagePicker().pickMultiImage(
      imageQuality: 70,
      maxWidth: 250,
    );
    for (int i = 0; i < selectedImages.length; i++) {
      setState(() {
         widget.imageFiles.add(File(selectedImages[i].path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              height: 200,
              child:  widget.imageFiles != null
                  ? ListView.builder(
                      itemCount:  widget.imageFiles.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.file(
                                          File( widget.imageFiles[index].path)))),
                              const SizedBox(height: 8),
                            ],
                          ),
                        );
                      },
                    )
                  : Container()),
          const SizedBox(height: 16),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _pickImages,
            child: const Text('Choose from Gallery'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _clearImages,
            child: const Text('Clear Images'),
          ),
        ],
      ),
    );
  }
}
