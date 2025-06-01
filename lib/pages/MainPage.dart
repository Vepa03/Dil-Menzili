import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:menzil_yoly/Applocale.dart';

class AutoSlider extends StatefulWidget {
  @override
  _AutoSliderState createState() => _AutoSliderState();
}

class _AutoSliderState extends State<AutoSlider> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final PageController _controller = PageController();
  int _currentPage = 0;
  late Timer _timer;




  @override
void initState() {
  super.initState();
  _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    if (!mounted || !_controller.hasClients) return;

    if (_currentPage < 2) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _controller.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  });
}

  @override
void dispose() {
  _timer.cancel();         // 🛑 Bu satır zorunlu!
  _controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final List<Widget> _slides = [
    SlideCard(
      title: Applocale.reason_1.getString(context),
      subtitle: Applocale.terjih_1.getString(context),
      buttonText: "Şu wagtdan başlaň",
      imagePath: "lib/assets/images/student_1.png",
    ),
    SlideCard(
      title: Applocale.reason_2.getString(context),
      subtitle: Applocale.terjih_2.getString(context),
      buttonText: "lib/assets/images/student_2.png",
      imagePath: "lib/assets/images/student_2.png",
    ),
    SlideCard(
      title: Applocale.reason_3.getString(context),
      subtitle: Applocale.terjih_3.getString(context),
      buttonText: "Yzarlamak üçin",
      imagePath: "lib/assets/images/student_1.png",
    ),
  ];
    return Scaffold(
      body: Column(
        children: [
          // Otomatik kayan slider
          SizedBox(
            height: height * 0.4,
            child: PageView.builder(
              controller: _controller,
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                return _slides[index];
              },
            ),
          ),
          // Alttaki flag listesi
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("lib/assets/images/etiket.png", width: width*0.09,),
                            SizedBox(width: width*0.05,),
                            Expanded(child: Text(Applocale.motive_1.getString(context), style: TextStyle(fontSize: width*0.055),))
                          ],
                        ),
                        SizedBox(height: height*0.04,),
                        Row(
                          children: [
                            Image.asset("lib/assets/images/explore.png", width: width*0.09,),
                            SizedBox(width: width*0.05,),
                            Expanded(child: Text(Applocale.motive_2.getString(context), style: TextStyle(fontSize: width*0.055),))
                          ],
                        ),
                        SizedBox(height: height*0.04,),
                        Row(
                          children: [
                            Image.asset("lib/assets/images/book.png", width: width*0.09,),
                            SizedBox(width: width*0.05,),
                            Expanded(child: Text(Applocale.motive_3.getString(context), style: TextStyle(fontSize: width*0.055),))
                          ],
                        ),
                        SizedBox(height: height*0.06,),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 4, 32, 244),
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(Applocale.berilyan_soraglar.getString(context), style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 4, 32, 244)),),
                      ),
                    ),
                    SizedBox(height: height*0.03,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("lib/assets/images/blue_icon_outlined.png", width: width*0.08,),
                            SizedBox(width: width*0.03,),
                            Expanded(
                              child: Text(Applocale.sorag_1.getString(context),style: TextStyle(fontSize: width*0.045),))
                          ],
                        ),
                        Text(Applocale.jogap_1.getString(context), style: TextStyle(fontSize: width*0.035), textAlign: TextAlign.start,)
                      ],
                    ),
                    Divider(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("lib/assets/images/blue_icon.png", width: width*0.08,),
                            SizedBox(width: width*0.03,),
                            Expanded(
                              child: Text(Applocale.sorag_2.getString(context),style: TextStyle(fontSize: width*0.045),))
                          ],
                        ),
                        Text(Applocale.jogap_2.getString(context), style: TextStyle(fontSize: width*0.035), textAlign: TextAlign.start,)
                      ],
                    ),
                    Divider(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("lib/assets/images/blue_icon_outlined.png", width: width*0.08,),
                            SizedBox(width: width*0.03,),
                            Expanded(
                              child: Text(Applocale.sorag_3.getString(context),style: TextStyle(fontSize: width*0.045),))
                          ],
                        ),
                        Text(Applocale.jogap_3.getString(context), style: TextStyle(fontSize: width*0.035), textAlign: TextAlign.start,)
                      ],
                    ),
                    Divider(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("lib/assets/images/blue_icon.png", width: width*0.08,),
                            SizedBox(width: width*0.03,),
                            Expanded(child: Text(Applocale.sorag_4.getString(context),style: TextStyle(fontSize: width*0.045),))
                          ],
                        ),
                        Text(Applocale.jogap_4.getString(context), style: TextStyle(fontSize: width*0.035), textAlign: TextAlign.start,)
                      ],
                    ),
                    Divider(),
                    
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

class SlideCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String? imagePath;

  const SlideCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagePath != null)
                Image.asset(imagePath!, width: width * 0.4, ),
              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(fontSize: width * 0.045, color: const Color.fromARGB(255, 4, 32, 244), fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: width * 0.04, ),
              ),
              // Buton eklenmek istenirse aktif et
              // if (buttonText.isNotEmpty)
              //   ElevatedButton(onPressed: () {}, child: Text(buttonText)),
            ],
          ),
        ),
      ),
    );
  }
}
