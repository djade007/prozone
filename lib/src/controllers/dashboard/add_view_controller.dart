import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:prozone/src/components/provider/provider_page.dart';
import 'package:prozone/src/init.dart';
import 'package:prozone/src/models/provider.dart';

class AddViewController extends GetxController {
  bool loading = false;
  final GlobalKey<FormBuilderState> formKey;

  AddViewController(this.formKey);

  void startLoading() {
    loading = true;
    update();
  }

  void stopLoading() {
    loading = false;
    update();
  }

  Future<void> submit() async {
    if (!formKey.currentState.saveAndValidate()) return;
    final data = formKey.currentState.value;

    startLoading();
    final res = await Api.createProvider(data);
    stopLoading();
    if (res.failed) {
      Utils.error(res.message);
      return;
    }
    Future.delayed(Duration(milliseconds: 400)).then((_) {
      Utils.success('Provider created successfully');
    });
    Get.toNamed(ProviderPage.routeName, arguments: Provider.fromMap(res.data));
  }
}
