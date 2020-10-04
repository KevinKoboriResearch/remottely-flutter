import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool isCollapsed = false;

Animation animation;

AnimationController controller;

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
    with TickerProviderStateMixin {
  int body = 0;
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

  // @override
  // void initState() {
  //   super.initState();

  //   controller = AnimationController(
  //       duration: const Duration(milliseconds: 500), vsync: this);
  // }

  @override
  void dispose() {
    _pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  //   @override
  // void dispose() {
  //   controller.dispose();

  //   super.dispose();
  // }

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

  // getBody(int body) {
  //   switch (body) {
  //     case 0:
  //       return Container(); // Home Screen

  //     case 1:
  //       return Container(); // Settings Screen
  //   }
  // }

  // getActions(int body) {
  //   switch (body) {
  //     case 0:
  //       return [
  //         Icon(Icons.settings),
  //         Icon(Icons.home),
  //       ]; // Home Screen

  //     case 1:
  //       return [
  //         Icon(Icons.home),
  //         Icon(Icons.settings),
  //       ]; // Settings Screen
  //   }
  // }

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
          isCollapsed ? body == 0 ? "CHAVES" : "EVENTOS" : "REMOTTELY",
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
                ? body == 0
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
        // actions: body == 0 ? Icon(Icons.settings) : Icon(Icons.menu),
        // getActions(body),
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
        // onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) => EventsTabsScreen(widget.favoriteMeals),
        //   ),
        // ),
        // },
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
                // SizedBox(height: 10),
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
                // SizedBox(height: 18),
                // Column(
                //   children: <Widget>[
                //     RaisedButton(
                //       onPressed: () {
                //         setState(() {
                //           body = 0;
                //         });
                //       },
                //       child: Text("Home"),
                //     ),
                //     RaisedButton(
                //       onPressed: () {
                //         setState(() {
                //           body = 1;
                //         });
                //       },
                //       child: Text("Settings"),
                //     ),
                //   ],
                // ),

                // Text("Configurações",
                //     style: TextStyle(color: Colors.white, fontSize: 16)),
                // SizedBox(height: 22),
                // Text("Notificações",
                //     style: TextStyle(color: Colors.white, fontSize: 16)),
                // SizedBox(height: 22),
                // Text("Usuários",
                //     style: TextStyle(color: Colors.white, fontSize: 16)),
                // SizedBox(height: 22),
                // Text("Meu perfil",
                //     style: TextStyle(color: Colors.white, fontSize: 16)),
                // SizedBox(height: 22),
                // Text("Contratar",
                //     style: TextStyle(color: Colors.white, fontSize: 16)),
                Spacer(flex: 2),
                // Text("Sair",
                //     style: TextStyle(color: Colors.white, fontSize: 22)),
                Spacer(flex: 3),
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
            child: Container(
              height: 300,
              // screenHeight * 0.2,
              // MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   mainAxisSize: MainAxisSize.max,
                  //   children: [
                  //     // InkWell(
                  //     //   child: Padding(
                  //     //     padding: const EdgeInsets.all(8.0),
                  //     //     child:
                  //     //         Icon(Icons.menu, size: 30, color: Colors.white),
                  //     //   ),
                  //     //   onTap: () {
                  //     //     setState(() {
                  //     //       if (isCollapsed)
                  //     //         _pageController.forward();
                  //     //       else
                  //     //         _pageController.reverse();

                  //     //       isCollapsed = !isCollapsed;
                  //     //     });
                  //     //   },
                  //     // ),
                  //     Center(
                  //       child: Text(
                  //         "oi CHAVES",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //     // InkWell(
                  //     //   child: Padding(
                  //     //     padding: const EdgeInsets.all(8.0),
                  //     //     child: Icon(Icons.settings,
                  //     //         size: 30, color: Colors.white),
                  //     //   ),
                  //     //   onTap: () {
                  //     //     setState(() {
                  //     //       if (isCollapsed)
                  //     //         _pageController.forward();
                  //     //       else
                  //     //         _pageController.reverse();

                  //     //       isCollapsed = !isCollapsed;
                  //     //     });
                  //     //   },
                  //     // ),
                  //   ],
                  // ),
                  // SizedBox(height: 20),
                  // Text(
                  //   "Chaves",
                  //   style: TextStyle(color: Colors.white, fontSize: 20),
                  // ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ListView.separated(
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
                            trailing:
                                // InkWell(
                                //   splashColor: Colors.green,
                                //   onTap: () {},
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: <Widget>[
                                //       FaIcon(
                                //         FontAwesomeIcons.key,
                                //         color: Colors.white,
                                //       ),
                                //       Text(
                                //         "Abrir",
                                //         style: TextStyle(color: Colors.white),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Container(
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
                                // padding: EdgeInsets.all(10.0),
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

                                // Column(
                                //   // Replace with a Row for horizontal icon + text
                                //   children: <Widget>[Icon(Icons.add), Text("Add")],
                                // ),
                              ),
                            ),
                            // RaisedButton.icon(
                            //   elevation: 0,
                            //   color: Colors.transparent,
                            //   onPressed: () {},
                            //   icon: FaIcon(FontAwesomeIcons.key,
                            //       color: Colors.white),
                            //   label: Text(
                            //     "Abrir",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                            // IconButton(
                            //   icon: FaIcon(FontAwesomeIcons.key,
                            //       color: Colors.white),
                            //   onPressed: () {
                            //     // setState(() {
                            //     //   if (isCollapsed)
                            //     //     _pageController.forward();
                            //     //   else
                            //     //     _pageController.reverse();

                            //     //   isCollapsed = !isCollapsed;
                            //     // });
                            //   },
                            //   iconSize: 16.0,
                            // ),

                            // InkWell(
                            //   child: FaIcon(FontAwesomeIcons.key,
                            //       size: 20, color: Colors.white),
                            //   onTap: () {
                            //     setState(() {
                            //       if (isCollapsed)
                            //         _pageController.forward();
                            //       else
                            //         _pageController.reverse();

                            //       isCollapsed = !isCollapsed;
                            //     });
                            //   },
                            // ),
                            // Text(
                            //   "3",
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //   ),
                            // ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(height: 16);
                        },
                        itemCount: 16),
                  )
                ],
              ),
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
                padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
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
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       """
// 12/07/2020""",
//                                       TextStyle(color: Colors.white10),
//                                     ),
                            // Text("14:27",
                            //     TextStyle(color: Colors.black26))
                            // ],
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 40,
                            //   child: FlatButton(
                            //     onPressed: () => {},
                            //     color: Colors.white,
                            //     textColor: Colors.black,
                            //     disabledTextColor: Colors.blue,
                            //     disabledColor: Colors.red,
                            //     focusColor: Colors.pink,
                            //     hoverColor: Colors.purple,
                            //     highlightColor: Colors.white,
                            //     splashColor: Colors.yellow,
                            //     child: Column(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.center,
                            //       children: <Widget>[
                            //         FaIcon(
                            //           FontAwesomeIcons.key,
                            //           size: 12,
                            //           color: Colors.pink,
                            //         ),
                            //         Text(
                            //           "Abrir",
                            //           style: TextStyle(
                            //             color: Colors.pink,
                            //             fontSize: 12,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
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
