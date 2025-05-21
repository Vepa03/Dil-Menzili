import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int current =0;
  static const TextStyle umumy_style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetoption = <Widget>[
    Text("Home", style: umumy_style,),
    Text("Courses", style: umumy_style,),
    Text("Teachers", style: umumy_style,)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dil Menzili", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 24),)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset("lib/assets/images/logo_hazir.png"),
          )
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("lib/assets/images/logo_hazir.png"),
              ),
              ListTile(
                title: Text("Biz Hakynda"),
                leading: Icon(Icons.abc),
                onTap: (){

                },
              ),
              ListTile(
                title: Text("Biz Hakynda"),
                leading: Icon(Icons.abc),
                onTap: (){
                  
                },
              ),
              ListTile(
                title: Text("Biz Hakynda"),
                leading: Icon(Icons.abc),
                onTap: (){
                  
                },
              ),
              ListTile(
                title: Text("Biz Hakynda"),
                leading: Icon(Icons.abc),
                onTap: (){
                  
                },
              ),
              Divider(color: Colors.black,),
              ListTile(
                title: Text("Biz Hakynda"),
                leading: Icon(Icons.abc),
                onTap: (){
                  
                },
              ),
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