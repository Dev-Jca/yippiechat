import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;

  const UserImagePicker({required this.imagePickFn, Key? key})
      : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImageFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
    });
    widget.imagePickFn(File(pickedImageFile!.path));
  }

  // Future<void> _takePicture() async {

  //   final appDir = await syspaths.getApplicationDocumentsDirectory();
  //   final fileName = path.basename(imageFile!.path);
  //   final savedImage =
  //       await File(imageFile.path).copy('${appDir.path}/$fileName');
  //   widget.onSelectImage(savedImage);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
          backgroundColor: Colors.grey,
          radius: 40,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
        ),
      ],
    );
  }
}
