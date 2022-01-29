import 'package:animated_sliebar/sildebar.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> menuKey = GlobalKey();
    return AnimatedSideBar(
      menuKey: menuKey,
      menuItems: const [],
      view1: HomeScreen(menu: menuKey),
      view2: const BackgroundScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> menu;
  const HomeScreen({Key? key, required this.menu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("render home screen");
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                menu.currentState!.openDrawer();
              },
              child: Text("open menu"))
        ],
      ),
    );
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("render background");
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
    );
  }
}
