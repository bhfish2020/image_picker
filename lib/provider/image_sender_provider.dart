

import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../repository/repository.dart';
import '../utils/app_constants.dart';

final postImageProvider = Provider.autoDispose<dynamic>((ref) async {
  final XFile? imageFile = ref.watch(imageFileProvider);
  print(imageFile!.path);
  FormData formData = FormData.fromMap({
    "file":
    await MultipartFile.fromFile(imageFile!.path, filename:"image-from-flutter"),
  });


  return ref.watch(repository).postFormData(AppConstants.SEND_IMAGE, formData, {});
});

//state notifier provider that holds an XFile

final imageFileProvider = StateNotifierProvider<ImageFileNotifier, XFile?>((ref) => ImageFileNotifier());

class ImageFileNotifier extends StateNotifier<XFile?> {
  ImageFileNotifier() : super(null);

  void setImageFile(XFile? imageFile) {
    state =  imageFile;
  }
}
