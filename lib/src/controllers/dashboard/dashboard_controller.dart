import 'package:get/get.dart';
import 'package:prozone/src/init.dart';

class DashboardController extends GetxController {
  RxInt _index = 0.obs;

  int get viewIndex => _index.value;

  PageController pageController;

  @override
  void onInit() {
    super.onInit();

    pageController = PageController();

    _loadTypes();
  }

  void updateIndex(int index, [bool animate = true]) {
    _index.value = index;
    if (animate)
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void _loadTypes() async {
    final res = await Api.providerTypes();

  }
}
