import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class MultiImages extends ChangeNotifier{
  int ?indexx;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile?>? imageFileList = [];


  //___________________________________________________________
  Future selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      notifyListeners();
    }}


  //____________________________________________________________
  Future deleteimage(indexx, imageFileList) async {
      await imageFileList.removeAt(indexx);
      print(imageFileList.length);
      notifyListeners();
    }

}