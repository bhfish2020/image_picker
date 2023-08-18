
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../provider/image_sender_provider.dart';



class ImagePickerButton extends StatefulWidget {
  @override
  _ImagePickerButtonState createState() => _ImagePickerButtonState();
}


class _ImagePickerButtonState extends State<ImagePickerButton> {
  File? _image;


  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);


    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image != null
            ? Image.file(_image!)
            : Placeholder(
          fallbackHeight: 200,
          fallbackWidth: double.infinity,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Choose an Image"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImage(ImageSource.gallery);
                    },
                    child: Text("Gallery"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImage(ImageSource.camera);
                    },
                    child: Text("Camera"),
                  ),
                ],
              ),
            );
          },
          child: Text("Pick Image"),
        ),
      ],
    );
  }
}

class Image1 extends ConsumerStatefulWidget {
  const Image1({super.key});

  @override
  ConsumerState createState() => _ImageState();
}



Future<void> _pickImage(ImageSource source, WidgetRef ref) async {
  final pickedFile = await ImagePicker().pickImage(source: source);


  if (pickedFile != null) {
    ref.watch(imageFileProvider.notifier).setImageFile(pickedFile);
  }
}

class _ImageState extends ConsumerState<Image1> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ref.watch(imageFileProvider)?.path != null
            ? Container(height:500, child: Image.file(File(ref.watch(imageFileProvider)!.path)))
            : Placeholder(
          fallbackHeight: 200,
          fallbackWidth: double.infinity,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Choose an Image"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImage(ImageSource.gallery, ref);
                    },
                    child: Text("Gallery"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImage(ImageSource.camera, ref);
                    },
                    child: Text("Camera"),
                  ),
                ],
              ),
            );
          },
          child: Text("Pick Image"),
        ),
      ],
    );
  }
}
