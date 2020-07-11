import 'package:get/get.dart';
import 'package:prozone/src/init.dart';
import 'package:prozone/src/models/provider.dart';
import 'package:prozone/src/models/provider_type.dart';

class HomeViewController extends GetxController {
  List<Provider> providers = [];

  List<Provider> topProviders;

  Map<ProviderType, List<Provider>> others;

  @override
  void onInit() {
    super.onInit();
    loadTopProviders();
    loadProviders();
  }

  void loadProviders() async {
    others = null;
    update();

    others = {};

    for (ProviderType type in Application.providerTypes) {
      final res = await Api.providers('provider_type=${type.id}');
      if (res.succeeded && res.data.length > 0) {
        others.addAll({
          type: res.data,
        });
        update();
      }
    }
  }

  void loadTopProviders() async {
    topProviders = null;
    update();

    final res = await Api.providers('rating_gte=4');

    if (res.succeeded) {
      topProviders = res.data;
    } else {
      topProviders = [];
    }
    update();
  }
}
