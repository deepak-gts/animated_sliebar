import 'package:flutter/material.dart';

class AnimatedSideBar extends StatefulWidget {
  final Widget view1;
  final Widget view2;
  final GlobalKey<ScaffoldState> menuKey;
  final List<Widget> menuItems;
  const AnimatedSideBar(
      {Key? key,
      required this.view1,
      required this.view2,
      required this.menuItems,
      required this.menuKey})
      : super(key: key);

  @override
  _AnimatedSideBarState createState() => _AnimatedSideBarState();
}

class _AnimatedSideBarState extends State<AnimatedSideBar> {
  double xOffset = 0;
  double yoOffset = 0;
  double scaleFactor = 1;
  bool isNotOpenDrawer = false;
  @override
  void initState() {
    xOffset = 0;
    yoOffset = 0;
    scaleFactor = 1;
    super.initState();
  }

  changeSlide() {
    isNotOpenDrawer = !isNotOpenDrawer;
    xOffset = isNotOpenDrawer ? 250 : 0;
    yoOffset = isNotOpenDrawer ? 70 : 0;
    scaleFactor = isNotOpenDrawer ? 0.8 : 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.menuKey,
      drawerScrimColor: Colors.transparent,
      onDrawerChanged: (v) {
        changeSlide();
        print("change drawer");
      },
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * .58,
        child: Drawer(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top * 2,
                ),
                ...widget.menuItems,
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          widget.view2,
          AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              transform:
                  Matrix4.translationValues((xOffset - 20), (yoOffset + 20), 0)
                    ..scale(scaleFactor - 0.06),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(scaleFactor == 1 ? 0 : 20)),
                  child: Container(
                    color: Colors.grey.shade300,
                  ))),
          AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              transform: Matrix4.translationValues(xOffset, yoOffset, 0)
                ..scale(scaleFactor),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(scaleFactor == 1 ? 0 : 20)),
                child: widget.view1,
              )),
        ],
      ),
    );
  }
}
