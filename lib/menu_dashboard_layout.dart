// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './models/shoe_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

bool isCollapsed = false;

Animation animation;

AnimationController controller;

final Color backgroundColor = Color(0x33003358);
int body = 0;
// const List<String, Object> keyList = [
//   {"id": 1, "name": "kevin kobori"},
//   {"id": 2, "name": "kevin"},
//   {"id": 3, "name": "kobori"},
//   {"id": 4, "name": "kevin kobori"},
//   {"id": 5, "name": "kevin"},
//   {"id": 6, "name": "kevin kobori"},
//   {"id": 7, "name": "kevin kobori"},
//   {"id": 8, "name": "kobori"},
//   {"id": 9, "name": "kevin kobori"},
//   {"id": 10, "name": "kevin kobori"},
//   {"id": 11, "name": "kevin"},
//   {"id": 12, "name": "kevin kobori"},
//   {"id": 13, "name": "kevin kobori"},
//   {"id": 14, "name": "kevin"},
//   {"id": 15, "name": "kevin kobori"},
//   {"id": 16, "name": "kevin"},
//   {"id": 17, "name": "kevin kobori"},
//   {"id": 18, "name": "kobori"},
//   {"id": 19, "name": "kevin kobori"},
//   {"id": 20, "name": "kevin"},
// ];
// static List<Object> list = [
//     Object(
//       id: 1,
//       name: "Festinha dos Amigos",
//       desc: "...",
//       price: 200000,
//       color: AppColors.blueColor,
//       brand: "Miguel Alcantara",
//       imgPath: "event.png",
//     ),
//     Object(
//       id: 2,
//       name: "Reunião Remottely",
//       desc: "Bora que bora galera!",
//       price: 7,
//       color: AppColors.yellowColor,
//       brand: "Kevin Kobori",
//       imgPath: "event.png",
//     ),
//     Object(
//       id: 3,
//       name: "Meu Casamento",
//       desc: "Valores.",
//       price: 3,
//       color: AppColors.redColor,
//       brand: "Filipe Barcelos",
//       imgPath: "event.png",
//     ),]

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

Widget _buildBottom(BuildContext context) {
  return CurvedNavigationBar(
    color: Colors.black,
    backgroundColor: Colors.transparent,
    items: <Widget>[
      FaIcon(FontAwesomeIcons.key, size: 25, color: Colors.white),
      Icon(Icons.event_note, size: 25, color: Colors.white)
    ],
    // onTap: (context) => _selectScreen,
  );
}

// Widget _buildBottom(BuildContext context) {
//   return Container(
//     // height: MediaQuery.of(context).size.height * 0.15,
//     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//     decoration: BoxDecoration(
//       color: Colors.transparent,
//       // shape: _diamondBorder,
//       borderRadius: BorderRadius.all(
//         Radius.circular(50),
//       ),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black12,
//           spreadRadius: 1,
//           blurRadius: 10,
//         )
//       ],
//     ),
//     child: CurvedNavigationBar(
//       backgroundColor: Colors.white,
//       items: <Widget>[
//         Icon(Icons.add, size: 30),
//         Icon(Icons.add, size: 30),
//         Icon(Icons.add, size: 30),
//         Icon(Icons.add, size: 30),
//         Icon(Icons.list, size: 30),
//         Icon(Icons.compare_arrows, size: 30),
//       ],
//       onTap: (index) {
//         //Handle button tap
//       },
//     ),
//     // Row(
//     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //   children: <Widget>[
//     //     Column(
//     //       mainAxisSize: MainAxisSize.min,
//     //       crossAxisAlignment: CrossAxisAlignment.start,
//     //       children: <Widget>[
//     //         Row(
//     //           children: [
//     //             RaisedButton(
//     //               color: backgroundColor,
//     //               // shape: _CustomButtomBorder(),
//     //               child: Text(
//     //                 "Eventos",
//     //                 style: TextStyle(color: Colors.pink),
//     //               ),
//     //               textColor: Colors.white,
//     //               onPressed: () => {},
//     //             ),
//     //             // Text(
//     //             //   // "${widget.shoeModel.price.toInt()}",
//     //             //   "48",
//     //             //   style: TextStyle(
//     //             //     fontWeight: FontWeight.bold,
//     //             //     fontSize: 28,
//     //             //   ),
//     //             // ),
//     //             // Padding(
//     //             //   padding: const EdgeInsets.only(left: 8),
//     //             //   child: Text(
//     //             //     "Convidados",
//     //             //     style: TextStyle(
//     //             //       color: Colors.black26,
//     //             //     ),
//     //             //   ),
//     //             // ),
//     //             // Icon(
//     //             //   Icons.account_circle,
//     //             //   color: Colors.black26,
//     //             //   size: 24.0,
//     //             //   semanticLabel: 'Text to announce in accessibility modes',
//     //             // ),
//     //           ],
//     //         )
//     //       ],
//     //     ),
//     //     RaisedButton(
//     //       color: backgroundColor,
//     //       shape: RoundedRectangleBorder(
//     //           borderRadius: BorderRadius.circular(18.0),
//     //           side: BorderSide(color: Colors.red)),
//     //       // shape: _CustomButtomBorder(),
//     //       child: Text(
//     //         "Eventos",
//     //         style: TextStyle(color: Colors.pink),
//     //       ),
//     //       textColor: Colors.white,
//     //       onPressed: () => {},
//     //     )
//     //     // RaisedButton.icon(
//     //     //   color: backgroundColor,
//     //     //   shape: _CustomButtomBorder(),
//     //     //   icon: Icon(
//     //     //     Icons.event_note,
//     //     //     color: Colors.pink,
//     //     //   ),
//     //     //   label: Text(
//     //     //     "Convidar",
//     //     //     style: TextStyle(color: Colors.pink),
//     //     //   ),
//     //     //   textColor: Colors.white,
//     //     //   onPressed: () => {},
//     //     // )
//     //     // Container(
//     //     //   padding: const EdgeInsets.symmetric(
//     //     //     vertical: 8,
//     //     //     horizontal: 8,
//     //     //   ),
//     //     //   decoration: BoxDecoration(
//     //     //     color: Colors.pink,
//     //     //     borderRadius: BorderRadius.all(
//     //     //       Radius.circular(50),
//     //     //     ),
//     //     //   ),
//     //     //   child: Text(
//     //     //     "Convidar",
//     //     //     style: TextStyle(
//     //     //       color: Colors.white,
//     //     //     ),
//     //     //   ),
//     //     // ),
//     //   ],
//     // ),
//   );
// }

Widget _eventoBuildBottom(BuildContext context) {
  return Container(
    // height: MediaQuery.of(context).size.height * 0.15,
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    // decoration: BoxDecoration(
    //   color: Colors.transparent,
    //   borderRadius: BorderRadius.only(
    //     topLeft: Radius.circular(30),
    //     topRight: Radius.circular(30),
    //   ),
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.black12,
    //       spreadRadius: 1,
    //       blurRadius: 10,
    //     )
    //   ],
    // ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  // "${widget.shoeModel.price.toInt()}",
                  "48",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Convidados",
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                ),
                // Icon(
                //   Icons.account_circle,
                //   color: Colors.black26,
                //   size: 24.0,
                //   semanticLabel: 'Text to announce in accessibility modes',
                // ),
              ],
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Text(
            "Convidar",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with TickerProviderStateMixin {
  List<Map<String, Object>> _screens;
  int _selectedScreenIndex = 0;
  List<ShoeModel> shoeList = ShoeModel.list;
  // int body = 0;
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
        // 'screen': FavoriteScreen(widget.favoriteMeals),
      },
      {
        'title': 'Eventos',
        // 'screen': FavoriteScreen(widget.favoriteMeals),
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
        // automaticallyImplyLeading: false,
        title: Text(
          // isCollapsed ? body == 0 ? "CHAVES" : "EVENTOS" : "REMOTTELY",
          _screens[_selectedScreenIndex]['title'],
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            color: Colors.black,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow,
              color: Colors.white,
              progress: controller,
            ),
            onPressed: () => _onpressed(),
            // Icon(
            //   Icons.menu,
            //   color: Colors.white,
            // ),
            // onPressed: () => {
            //   setState(() {
            //     if (isCollapsed)
            //       _pageController.forward();
            //     else
            //       _pageController.reverse();

            //     isCollapsed = !isCollapsed;
            //   }),
            // },
          ),
        ),
        actions: [
          IconButton(
            icon: isCollapsed
                ? body == 1
                    ? FaIcon(FontAwesomeIcons.key)
                    : Icon(Icons.event_note)
                : Icon(Icons.settings),
            onPressed: () => {
              if (!isCollapsed)
                {
//logout
                }
              else if (body == 1)
                {
                  setState(() {
                    body = 0;
                  })
                }
              else
                {
                  setState(() {
                    body = 1;
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
            ? body == 0 ? Icon(Icons.blur_on) : Icon(Icons.add)
            : Icon(Icons.subdirectory_arrow_left),
        // FaIcon(FontAwesomeIcons.subdirectory_arrow_left),
        shape: _DiamondBorder(),
      ),
      floatingActionButtonLocation: isCollapsed
          ? body == 0
              ? FloatingActionButtonLocation.centerFloat
              : FloatingActionButtonLocation.endFloat
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
    if (body == 0) {
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
                  // height: MediaQuery.of(context).size.height,
                  // height: MediaQuery.of(context).size.height * 0.78,
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 40),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: shoeList.length,
                    itemBuilder: (context, index) {
                      final kl = shoeList[index];
                      return ListTile(
                        title: Text(
                          "${kl.name.toString()}",
                          // "Chave X",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${kl.brand.toString()}",
                          // brand
                          // "Kevin Kobori",
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
                    // separatorBuilder: (context, index) {
                    //   return Divider(
                    //     height: 12,
                    //     thickness: 3,
                    //     indent: 16,
                    //     endIndent: 16,
                    //     color: Color(0x33003328),
                    //   );
                    // },
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
                  // _buildBottom(context),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              "Evento X",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              "Bryan Kobori",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // FaIcon(
                                //   FontAwesomeIcons.key,
                                //   size: 12,
                                //   color: Colors.pink,
                                // ),
                                Text(
                                  "12/07/2020 - 14:26",
                                  // "14:26",
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
                          return Divider(height: 16);
                        },
                        itemCount: 16)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
