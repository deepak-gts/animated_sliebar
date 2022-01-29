import 'package:animated_sliebar/sildebar.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white);
    final GlobalKey<ScaffoldState> menuKey = GlobalKey();
    return AnimatedSideBar(
      menuKey: menuKey,
      menuItems: [
        ListTile(
          title: Text(
            "Home",
            style: textStyle,
          ),
        ),
        ListTile(
          title: Text(
            "Contact Us",
            style: textStyle,
          ),
        ),
        ListTile(
          title: Text(
            "Feedback",
            style: textStyle,
          ),
        ),
        ListTile(
          title: Text(
            "Logout",
            style: textStyle,
          ),
        ),
      ],
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Sidebar"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: menu.currentState!.openDrawer,
        ),
      ),
    );
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.indigo,
    );
  }
}
