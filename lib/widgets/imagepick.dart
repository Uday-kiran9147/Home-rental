// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_field, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  List<File>? imageFiles;
  ImagePick({
    Key? key,
    this.imageFiles,
  }) : super(key: key);
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  void _clearImages() {
    setState(() {
      widget.imageFiles = null;
      isselectingImages = false;
    });
  }

  _selectImage() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  _pickImages(source: ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text('Gallery'),
                onTap: () {
                  _pickImages(source: ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  bool isselectingImages = false;
  Future<void> _pickImages({required ImageSource source}) async {
    setState(() {
      isselectingImages = true;
    });
    List<XFile>? selectedImages = await ImagePicker().pickMultiImage(
      imageQuality: 70,
      maxWidth: 250,
    );
    if (selectedImages == null) return;

    for (int i = 0; i < selectedImages.length; i++) {
      setState(() {
        widget.imageFiles!.add(File(selectedImages[i].path));
      });
    }
    setState(() {
      isselectingImages = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          isselectingImages
              ? const LinearProgressIndicator(
                  semanticsLabel: 'Loading images',
                )
              : Container(),
          widget.imageFiles != null && widget.imageFiles!.isNotEmpty
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                          height: 250,
                          child: ListView.builder(
                            itemCount: widget.imageFiles!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                // An Expanded widget must be a descendant of a Row, Column, or Flex,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            child: Image.file(
                                              widget.imageFiles![index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              );
                            },
                          )),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: IconButton(
                          onPressed: _clearImages,
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          // const SizedBox(height: 16),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _selectImage,
            child: const Text('Pick Images'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
