import 'package:flutter/services.dart';
import 'package:prozone/src/components/dashboard/dashboard_page.dart';
import 'package:prozone/src/components/provider/provider_page.dart';
import 'package:prozone/src/init.dart';

Future<void> main() async {
  await Application.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: status_bar_color,
      ),
    );
    return GestureDetector(
      onTap: () {
        // close keyboard when user taps outside
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          currentFocus.requestFocus(FocusNode());
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ProZone',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: DashboardPage.routeName,
        getPages: <GetPage>[
          GetPage(
            name: DashboardPage.routeName,
            page: () => DashboardPage(),
          ),
          GetPage(
            name: ProviderPage.routeName,
            page: () => ProviderPage(),
          ),
        ],
      ),
    );
  }
}
