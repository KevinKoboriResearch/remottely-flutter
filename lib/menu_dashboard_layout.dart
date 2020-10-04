// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './models/shoe_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

bool isCollapsed = false;

Animation animation;

AnimationController controller;

final Color backgroundColor = Color(0x33003358);
// int body = 0;

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

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

class _CustomButtomBorder extends ShapeBorder {
  const _CustomButtomBorder();

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

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

// Widget keysPage(BuildContext context) {
//   return;
// }

// Widget eventsPage(BuildContext context) {
//   return;
// }

// Widget _buildBottom(BuildContext context) {
//   return CurvedNavigationBar(
//     color: Colors.black,
//     backgroundColor: Colors.transparent,
//     items: <Widget>[
//       FaIcon(FontAwesomeIcons.key, size: 25, color: Colors.white),
//       Icon(Icons.event_note, size: 25, color: Colors.white)
//     ],
//     // onTap: (context) => _selectScreen,
//   );
// }

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with TickerProviderStateMixin {
  List<Map<String, Object>> _screens;
  int _selectedScreenIndex = 0;
  List<ShoeModel> shoeList = ShoeModel.list;
  List<ShoeModel> secondShoeList = ShoeModel.secondList;
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _pageController;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Chaves',
        'screen': 0,
        // 'screen': FavoriteScreen(widget.favoriteMeals),
      },
      {
        'title': 'Eventos',
        'screen': 1,
        // 'screen': CategoriesScreen(),
      },
    ];
    _pageController = AnimationController(vsync: this, duration: duration);
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0.8).animate(_pageController);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_pageController);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_pageController);
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  _onpressed() {
    setState(() {
      isCollapsed ? controller.forward() : controller.reverse();
      if (isCollapsed)
        _pageController.forward();
      else
        _pageController.reverse();

      isCollapsed = !isCollapsed;
    });
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
        title: Text(
          _screens[_selectedScreenIndex]['title'],
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            color: Colors.green,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow,
              color: Colors.white,
              progress: controller,
            ),
            onPressed: () => _onpressed(),
          ),
        ),
        actions: [
          IconButton(
            icon: isCollapsed
                ? _screens[_selectedScreenIndex]['screen'] == 0
                    ? FaIcon(FontAwesomeIcons.key)
                    : Icon(Icons.event_note)
                : Icon(Icons.settings),
            onPressed: () => {
              if (!isCollapsed)
                {
//settings
                }
              else if (_screens[_selectedScreenIndex]['screen'] == 0)
                {
                  setState(() {
                    // pagina soliticar chave
                  })
                }
              else
                {
                  setState(() {
                    // fazer alguma coisa pra evento
                  })
                }
            },
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
          // _screens[_selectedScreenIndex]['screen'],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        splashColor: Colors.pink,
        onPressed: () => {
//           if (!isCollapsed)
//             {
// //logout
//             }
//           else if (body == 1)
//             {
//               setState(() {
//                 body = 0;
//               })
//             }
//           else
//             {
//               setState(() {
//                 body = 1;
//               })
//             }
        },
        child: isCollapsed
            ? _screens[_selectedScreenIndex]['screen'] == 0
                ? Icon(Icons.blur_on)
                : Icon(Icons.add)
            : Icon(Icons.subdirectory_arrow_left),
        shape: _DiamondBorder(),
      ),
      floatingActionButtonLocation: isCollapsed
          ? _screens[_selectedScreenIndex]['screen'] == 0
              ? FloatingActionButtonLocation.centerFloat
              : FloatingActionButtonLocation.miniEndTop
          : FloatingActionButtonLocation.startFloat,
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 64.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 2),
                Column(children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2016/01/19/17/48/woman-1149911_960_720.jpg'),
                    ),
                  ),
                ]),
                SizedBox(height: 20),
                Text("Emanuele Gomes",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 10),
                Text("Moradora",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                Spacer(flex: 1),
                Row(children: <Widget>[
                  Icon(Icons.history, size: 25, color: Colors.white),
                  Text("  Histórico",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ]),
                SizedBox(height: 18),
                Row(children: <Widget>[
                  Icon(Icons.settings, size: 25, color: Colors.white60),
                  Text("  Configurações",
                      style: TextStyle(color: Colors.white60, fontSize: 16)),
                ]),
                SizedBox(height: 18),
                Row(children: <Widget>[
                  Icon(Icons.notifications, size: 25, color: Colors.white60),
                  Text("  Notificações",
                      style: TextStyle(color: Colors.white60, fontSize: 16)),
                ]),
                SizedBox(height: 18),
                Row(children: <Widget>[
                  Icon(Icons.question_answer, size: 25, color: Colors.white60),
                  Text("  Chat",
                      style: TextStyle(color: Colors.white60, fontSize: 16)),
                ]),
                SizedBox(height: 18),
                Row(children: <Widget>[
                  Icon(Icons.supervisor_account,
                      size: 25, color: Colors.white60),
                  Text("  Usuários",
                      style: TextStyle(color: Colors.white60, fontSize: 16)),
                ]),
                SizedBox(height: 18),
                Row(children: <Widget>[
                  Icon(Icons.account_circle, size: 25, color: Colors.white60),
                  Text("  Meu perfil",
                      style: TextStyle(color: Colors.white60, fontSize: 16)),
                ]),
                SizedBox(height: 18),
                Row(children: <Widget>[
                  Icon(Icons.insert_drive_file,
                      size: 25, color: Colors.white60),
                  Text("  Contratar",
                      style: TextStyle(color: Colors.white60, fontSize: 16)),
                ]),
                Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    if (_screens[_selectedScreenIndex]['screen'] == 0) {
      return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.6 * screenWidth,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            animationDuration: duration,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            elevation: 8,
            color: backgroundColor,
            child: Stack(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: shoeList.length,
                    itemBuilder: (context, index) {
                      final kl = shoeList[index];
                      return ListTile(
                        title: Text(
                          "${kl.name.toString()}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${kl.brand.toString()}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Container(
                          width: 60,
                          height: 40,
                          child: FlatButton(
                            onPressed: () => {},
                            color: Colors.transparent,
                            textColor: Colors.black,
                            disabledTextColor: Colors.blue,
                            disabledColor: Colors.red,
                            focusColor: Colors.pink,
                            hoverColor: Colors.purple,
                            highlightColor: Colors.white,
                            splashColor: Colors.yellow,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.key,
                                  size: 12,
                                  color: Colors.pink,
                                ),
                                Text(
                                  "Abrir",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 12,
                        thickness: 3,
                        indent: 16,
                        endIndent: 16,
                        color: Color(0x33003328),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: CurvedNavigationBar(
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                    items: <Widget>[
                      FaIcon(FontAwesomeIcons.key,
                          size: 25, color: Colors.black),
                      Icon(Icons.event_note, size: 25, color: Colors.black)
                    ],
                    onTap: _selectScreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.6 * screenWidth,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            animationDuration: duration,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            elevation: 8,
            color: backgroundColor,
            child: Stack(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: secondShoeList.length,
                    itemBuilder: (context, index) {
                      final kl = secondShoeList[index];
                      return ListTile(
                        title: Text(
                          "${kl.name.toString()}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${kl.brand.toString()}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "12/07/2020 - 14:26",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 12,
                        thickness: 3,
                        indent: 16,
                        endIndent: 16,
                        color: Color(0x33003328),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: CurvedNavigationBar(
                    color: Colors.black,
                    backgroundColor: Colors.transparent,
                    items: <Widget>[
                      FaIcon(FontAwesomeIcons.key,
                          size: 25, color: Colors.white),
                      Icon(Icons.event_note, size: 25, color: Colors.white)
                    ],
                    onTap: _selectScreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
