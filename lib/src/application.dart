import 'package:get_storage/get_storage.dart';
import 'package:prozone/src/models/provider_type.dart';
import 'package:prozone/src/models/state_location.dart';

import 'init.dart';

class Application {
  static var box = GetStorage('default');
  static List<ProviderType> providerTypes = [];
  static List<StateLocation> states = [];

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await box.initStorage;

    await Future.wait([loadProviderTypes(), loadStates()]);
  }

  static Future<void> loadProviderTypes() async {
    // load and cache on first load
    if (box.hasData(Keys.providerTypes)) {
      providerTypes =
          ProviderType.resolveList(List.from(box.read(Keys.providerTypes)));
      return;
    }
    final res = await Api.providerTypes();

    if (res.succeeded) {
      box.write(Keys.providerTypes, res.data);
      providerTypes =
          ProviderType.resolveList(List.from(box.read(Keys.providerTypes)));
    }
  }

  static Future<void> loadStates() async {
    // load and cache on first load
    if (box.hasData(Keys.states)) {
      states = StateLocation.resolveList(List.from(box.read(Keys.states)));
      return;
    }
    final res = await Api.states();

    if (res.succeeded) {
      box.write(Keys.states, res.data);
      states = StateLocation.resolveList(List.from(box.read(Keys.states)));
    }
  }
}
