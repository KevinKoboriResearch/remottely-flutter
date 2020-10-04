import 'package:flutter/material.dart';

final Color backgroundColor = Color(0x33003358);

class _DiamondBorder extends ShapeBorder {
  const _DiamondBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 4.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        // automaticallyImplyLeading: false,
        title: Text(
          "REMOTTELY",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            color: Colors.black,
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => {
              setState(() {
                if (isCollapsed)
                  _controller.forward();
                else
                  _controller.reverse();

                isCollapsed = !isCollapsed;
              }),
            },
          ),
        ),
        actions: [],
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 0,
      //   // color: Theme.of(context).primaryColor,
      //   color: Colors.transparent,
      //   shape: const CircularNotchedRectangle(),
      //   child: BottomNavigationBar(
      //     // onTap: _selectScreen,
      //     selectedItemColor: Theme.of(context).accentColor,
      //     // currentIndex: _selectedScreenIndex,
      //     unselectedItemColor: Colors.black26,
      //     type: BottomNavigationBarType.fixed,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.star),
      //         title: Text('Chaves'),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.vpn_key),
      //         title: Text("Eventos"),
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        splashColor: Colors.pink,
        onPressed: () => {
          // onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (_) => EventsTabsScreen(widget.favoriteMeals),
          //   ),
          // ),
          // },
        },
        child: Icon(Icons.event_note),
        shape: _DiamondBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 20),
                Text("Messages",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 20),
                Text("Utility Bills",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 20),
                Text("Funds Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 20),
                Text("Branches",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // InkWell(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child:
                      //         Icon(Icons.menu, size: 30, color: Colors.white),
                      //   ),
                      //   onTap: () {
                      //     setState(() {
                      //       if (isCollapsed)
                      //         _controller.forward();
                      //       else
                      //         _controller.reverse();

                      //       isCollapsed = !isCollapsed;
                      //     });
                      //   },
                      // ),
                      Text(
                        "CHAVES",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      // InkWell(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Icon(Icons.settings,
                      //         size: 30, color: Colors.white),
                      //   ),
                      //   onTap: () {
                      //     setState(() {
                      //       if (isCollapsed)
                      //         _controller.forward();
                      //       else
                      //         _controller.reverse();

                      //       isCollapsed = !isCollapsed;
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Text(
                  //   "Chaves",
                  //   style: TextStyle(color: Colors.white, fontSize: 20),
                  // ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Chave X",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            "Kevin Kobori",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: Text(
                            "3",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(height: 16);
                      },
                      itemCount: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
