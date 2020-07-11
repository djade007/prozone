import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:prozone/src/components/dashboard/views/add_view.dart';
import 'package:prozone/src/components/dashboard/views/home_view.dart';
import 'package:prozone/src/controllers/dashboard/dashboard_controller.dart';
import 'package:prozone/src/init.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = 'dashboard';

  final page = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: page.pageController,
          onPageChanged: (index) {
            page.updateIndex(index, false);
          },
          children: <Widget>[
            _buildViewLayout(HomeView()),
            _buildViewLayout(AddView()),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildViewLayout(Widget child) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Obx(
      () => BottomNavyBar(
        selectedIndex: page.viewIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: page.updateIndex,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.add),
              title: Text('Add New'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue),
        ],
      ),
    );
  }
}
