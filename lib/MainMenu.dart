import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:menzil_yoly/pages/Courses.dart';
import 'package:menzil_yoly/pages/MainPage.dart';
import 'package:menzil_yoly/pages/Teachers.dart';
import 'package:menzil_yoly/pages/about_us.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int current =0;
  static const TextStyle umumy_style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
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
            title: Center(child: Text("Dil Menzili", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 24),)),
            backgroundColor: Colors.white,
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
                    leading: Icon(Icons.contact_emergency_outlined),
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
                                leading: Image.asset("lib/assets/images/instagram_black.png", width: width*0.09,), 
                                onTap: (){
                                  
                                },
                              ),
                              ListTile(
                                title: Text("TikTok"),
                                leading: Image.asset("lib/assets/images/tiktok_black.png",width: width*0.09),
                                onTap: (){
                                  
                                },
                              ),
                              ListTile(
                                title: Text("Website"),
                                leading: Image.asset("lib/assets/images/website_black.png", width: width*0.09),
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
                            ],
                          ),
                        ),
                      ));
                    },
                  ),
                  Divider(color: Colors.black,),
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
          color: Colors.white, 
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ]
        ),
        child: SafeArea(child: 
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GNav(
              backgroundColor: Colors.white,
              rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 10,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
              tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.subject,
                text: "Courses",
              ),
              GButton(
                icon: Icons.book,
                text: "Teachers",
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