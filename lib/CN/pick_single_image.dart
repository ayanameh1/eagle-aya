import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

////pick image for the POSTER________________________________________________
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
}

//________________________________________________________________________________________________________________________

////pick image for the PRODUCT ______________________________________________
class productSingleImage extends ChangeNotifier{
  File? proimage;
  final propicker = ImagePicker();

  //image from camera
  Future imagefromCamera() async {
    final pickedimage = await propicker.pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      proimage = File(pickedimage.path);
      notifyListeners();
    }
  }

  //image from gallery
  Future imagefromGallery() async {
    final pickedimage = await propicker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      proimage = File(pickedimage.path);
      notifyListeners();
    }
  }
}