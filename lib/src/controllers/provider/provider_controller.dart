import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:prozone/src/init.dart';
import 'package:prozone/src/models/provider.dart';

class ProviderController extends GetxController {
  final Provider provider = Get.arguments;
  List<Asset> images = [];
  bool uploading = false;

  Future<void> loadAssets() async {
    images = List<Asset>();
    update();

    List<Asset> resultList;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
      );
    } on Exception catch (e) {
      print(e);
    }

    if (resultList != null) {
      images = resultList;
      update();
    }
  }

  void upload() {
    
  }
}
