

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../repository/repository.dart';
import '../utils/app_constants.dart';

final postTestProvider = FutureProvider.autoDispose<dynamic>((ref) async {
  final XFile? imageFile = ref.watch(imageFileProvider);
  return ref.watch(repository).post(AppConstants.SEND_IMAGE, {"file":imageFile}, {});
});

//state notifier provider that holds an XFile

final imageFileProvider = StateNotifierProvider<ImageFileNotifier, XFile?>((ref) => ImageFileNotifier());

class ImageFileNotifier extends StateNotifier<XFile?> {
  ImageFileNotifier() : super(null);

  void setImageFile(XFile? imageFile) {
    state = imageFile;
  }
}
