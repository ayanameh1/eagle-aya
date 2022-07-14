import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class SingleImage extends ChangeNotifier{
  File? image;
  final picker = ImagePicker();

  //image from camera
  Future imagefromCamera() async {
    final pickedimage = await picker.pickImage(source: ImageSource.camera);
      if (pickedimage != null) {
        image = File(pickedimage.path);
        notifyListeners();
      }
  }

  //image from gallery
  Future imagefromGallery() async {
    final pickedimage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        image = File(pickedimage.path);
        notifyListeners();
      }
  }


  //
  // Future deleteimage(indexx, imageFileList) async {
  //   await imageFileList.removeAt(indexx);
  //   print(imageFileList.length);
  //   notifyListeners();
  // }

}