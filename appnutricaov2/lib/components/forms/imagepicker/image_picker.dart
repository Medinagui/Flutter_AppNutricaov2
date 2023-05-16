// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/widgets.dart';
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

Uint8List? selectedImage;

class _MyImagePickerState extends State<MyImagePicker> {
  File? image;

  Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      
      final Uint8List imageToBinary = await image.readAsBytes(); 
      //String base64 = base64Encode(imageToBinary);

      final imageTemporary = File(image.path);

      setState(() {
        selectedImage = imageToBinary;
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
