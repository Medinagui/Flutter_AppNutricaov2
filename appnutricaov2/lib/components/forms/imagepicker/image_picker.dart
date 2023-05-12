// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'image_picker_ifphoto.dart';
import 'image_picker_elsephoto.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

String? imageSelected;

class _MyImagePickerState extends State<MyImagePicker> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      
      final imageTemporary = File(image.path);

      final Directory caminho = await getApplicationDocumentsDirectory();
      final File newImage = await imageTemporary.copy('${caminho.path}/image1.jpg');
      final String newCaminho = newImage.path;
      setState(() {
        this.image = imageTemporary;
        imageSelected = newCaminho;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  get getImage{
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return image != null
        ? ImgPickerIfPhoto(
            pickImage: pickImage,
            image: image,
          )
        : ImgPickerElsePhoto(
            pickImage: pickImage,
            image: image,
          );
  }
}
