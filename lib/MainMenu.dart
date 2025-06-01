
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:menzil_yoly/ThemeProvider.dart';
import 'package:menzil_yoly/pages/Courses.dart';
import 'package:menzil_yoly/pages/MainPage.dart';
import 'package:menzil_yoly/pages/Teachers.dart';
import 'package:menzil_yoly/pages/about_us.dart';
import 'package:menzil_yoly/pages/registration.dart';
import 'package:menzil_yoly/theme/gnav_styles.dart';
import 'package:provider/provider.dart';
import 'package:menzil_yoly/Applocale.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  final FlutterLocalization _localization = FlutterLocalization.instance;
  int current =0;
  String get tema_ady => tema_ikon ? Applocale.light.getString(context) : Applocale.night.getString(context);
  bool tema_ikon = false;
  bool social_media_image = false;

  tema_ikon_utget(){
    setState(() {
      tema_ikon = !tema_ikon;
    });
  }
  social_media(){
    setState(() {
      social_media_image = !social_media_image;
    });
  }
  final List<Widget> _widgetoption =[
    AutoSlider(),
    const Courses(),
    const Teachers(),
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
                    title: Text(Applocale.girish.getString(context)),
                    leading: Icon(Icons.login_outlined),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                    },
                  ),
                  
                  ListTile(
                    title: Text(Applocale.contact.getString(context)),
                    leading: Icon(Icons.mail_outline),
                    onTap: (){
                      showDialog(context: context, 
                      builder: (context)=>AlertDialog(
                        title: Text(Applocale.contact_us.getString(context)),
                        content: SizedBox(
                          height: height*0.2,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(Applocale.Instagram.getString(context)),
                                leading: Image(image: AssetImage(
                                  Theme.of(context).brightness == Brightness.dark ? "lib/assets/images/instagram_white.png" : "lib/assets/images/instagram_black.png"
                                ), width: width*0.09,),
                                onTap: (){
                                  
                                },
                              ),
                              ListTile(
                                title: Text(Applocale.tiktok.getString(context)),
                                leading: Image(image: AssetImage(
                                  Theme.of(context).brightness == Brightness.dark ? "lib/assets/images/tiktok_white.png" : "lib/assets/images/tiktok_black.png"
                                ), width: width*0.09,),
                                onTap: (){
                                  
                                },
                              ),
                              ListTile(
                                title: Text(Applocale.webpage.getString(context)),
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
                    title: Text(Applocale.share.getString(context)),
                    leading: Icon(Icons.share_outlined),
                    onTap: (){
                      
                    },
                  ),
                  ListTile(
                    title: Text(tema_ady),
                    leading: Icon(tema_ikon ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined),
                    onTap: (){
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      tema_ikon_utget();
                    },
                  ),
                  ListTile(
                    title: Text(Applocale.language.getString(context)),
                    leading: Icon(Icons.language_outlined),
                    onTap: (){
                      showDialog(context: context, 
                      builder: (_)=> AlertDialog(
                        title: Center(child: Text(Applocale.change_language.getString(context), style: TextStyle(fontSize: width*0.07, fontWeight: FontWeight.bold),  )),
                        content: SizedBox(
                          height: height*0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(Applocale.turkmen.getString(context)),
                                leading: Image.asset("lib/assets/images/tkm_flag.png"),
                                onTap: (){
                                  _localization.translate('km');
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text(Applocale.english.getString(context)),
                                leading: Image.asset("lib/assets/images/britain_flag.png"),
                                onTap: (){
                                  _localization.translate('en');
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text(Applocale.german.getString(context)),
                                leading: Image.asset("lib/assets/images/german_flag.png"),
                                onTap: (){
                                  _localization.translate('de');
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text(Applocale.russian.getString(context)),
                                leading: Image.asset("lib/assets/images/ruassian_flag.png"),
                                onTap: (){
                                  _localization.translate('ru');
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text(Applocale.turkish.getString(context)),
                                leading: Image.asset("lib/assets/images/turkey.png"),
                                onTap: (){
                                  _localization.translate('tr');
                                  Navigator.pop(context);
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
                    title: Text(Applocale.about_us.getString(context)),
                    leading: Icon(Icons.info_outline),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(Applocale.version.getString(context)),
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
                text: Applocale.home_page.getString(context),
              ),
              GButton(
                icon: Icons.menu_book_outlined,
                text: Applocale.course_page.getString(context),
              ),
              GButton(
                icon: Icons.person_outline,
                text: Applocale.teacher_page.getString(context),
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