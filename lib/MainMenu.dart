import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:menzil_yoly/ThemeProvider.dart';
import 'package:menzil_yoly/pages/Courses.dart';
import 'package:menzil_yoly/pages/MainPage.dart';
import 'package:menzil_yoly/pages/Teachers.dart';
import 'package:menzil_yoly/pages/about_us.dart';
import 'package:menzil_yoly/theme/gnav_styles.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int current =0;
  String tema_ady = "Gije";
  bool tema_ikon = false;
  bool social_media_image = false;

  tema_ikon_utget(){
    setState(() {
      tema_ikon = !tema_ikon;
    });
  }
  tema_ady_uytget(){
    setState(() {
      tema_ady = tema_ady == "Gije" ? "Gundiz": "Gije";
    });
  }
  social_media(){
    setState(() {
      social_media_image = !social_media_image;
    });
  }
  static const List<Widget> _widgetoption = <Widget>[
    Mainpage(),
    Courses(),
    Teachers(),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
          child: AppBar(
            title: Center(child: Text("Dil Menzili", style: TextStyle(fontSize: width*0.07, fontWeight: FontWeight.bold),)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset("lib/assets/images/logo_hazir.png"),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("lib/assets/images/logo_hazir.png"),
              ),
              Column(
                children: [
                  
                  ListTile(
                    title: Text("Habarlashmak ucin"),
                    leading: Icon(Icons.mail_outline),
                    onTap: (){
                      showDialog(context: context, 
                      builder: (context)=>AlertDialog(
                        title: Text("Habarlashamak ucin"),
                        content: SizedBox(
                          height: height*0.2,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("Instagram"),
                                leading: Image(image: AssetImage(
                                  Theme.of(context).brightness == Brightness.dark ? "lib/assets/images/instagram_white.png" : "lib/assets/images/instagram_black.png"
                                ), width: width*0.09,),
                                onTap: (){
                                  
                                },
                              ),
                              ListTile(
                                title: Text("TikTok"),
                                leading: Image(image: AssetImage(
                                  Theme.of(context).brightness == Brightness.dark ? "lib/assets/images/tiktok_white.png" : "lib/assets/images/tiktok_black.png"
                                ), width: width*0.09,),
                                onTap: (){
                                  
                                },
                              ),
                              ListTile(
                                title: Text("Website"),
                                leading: Image(image: AssetImage(
                                  Theme.of(context).brightness == Brightness.dark ? "lib/assets/images/website_white.png" : "lib/assets/images/website_black.png"
                                ), width: width*0.09,),
                                onTap: (){
                                  
                                },
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text("Paylash"),
                    leading: Icon(Icons.share_outlined),
                    onTap: (){
                      
                    },
                  ),
                  ListTile(
                    title: Text(tema_ady),
                    leading: Icon(tema_ikon ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined),
                    onTap: (){
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      tema_ady_uytget();
                      tema_ikon_utget();
                    },
                  ),
                  ListTile(
                    title: Text("Dilini Uytget"),
                    leading: Icon(Icons.language_outlined),
                    onTap: (){
                      showDialog(context: context, 
                      builder: (_)=> AlertDialog(
                        title: Center(child: Text("Dilini uytget", style: TextStyle(fontSize: width*0.07, fontWeight: FontWeight.bold),  )),
                        content: SizedBox(
                          height: height*0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("Turkmen dili"),
                                leading: Image.asset("lib/assets/images/tkm_flag.png"),
                                onTap: (){

                                },
                              ),
                              ListTile(
                                title: Text("Inlis dili"),
                                leading: Image.asset("lib/assets/images/britain_flag.png"),
                                onTap: (){

                                },
                              ),
                              ListTile(
                                title: Text("Nemes dili"),
                                leading: Image.asset("lib/assets/images/german_flag.png"),
                                onTap: (){

                                },
                              ),
                              ListTile(
                                title: Text("Rus dili"),
                                leading: Image.asset("lib/assets/images/ruassian_flag.png"),
                                onTap: (){

                                },
                              ),
                              ListTile(
                                title: Text("Turk dili"),
                                leading: Image.asset("lib/assets/images/turkey.png"),
                                onTap: (){

                                },
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Biz Hakynda"),
                    leading: Icon(Icons.info_outline),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text("Version 1.0.0"),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetoption.elementAt(current),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).extension<GNavTheme>()!.backgroundColor,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ]
        ),
        child: SafeArea(child: 
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GNav(
              backgroundColor: Theme.of(context).extension<GNavTheme>()!.backgroundColor,
              rippleColor: Theme.of(context).extension<GNavTheme>()!.rippleColor,
                hoverColor: Theme.of(context).extension<GNavTheme>()!.hoverColor,
                gap: 10,
                activeColor: Theme.of(context).extension<GNavTheme>()!.activeColor,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Theme.of(context).extension<GNavTheme>()!.tabBackgroundColor,
                color: Theme.of(context).extension<GNavTheme>()!.inactiveColor,
              tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.menu_book_outlined,
                text: "Courses",
              ),
              GButton(
                icon: Icons.person_outline,
                text: "Mugallymlar",
              ),
              ],
              selectedIndex: current,
              onTabChange: (index){
                setState(() {
                  current = index;
                });
              },),
          )),
      )
    );
  }
}