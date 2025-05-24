import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:menzil_yoly/MainMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: DelayingPage()
    );
  }
}
class DelayingPage extends StatefulWidget {
  const DelayingPage({super.key});

  @override
  State<DelayingPage> createState() => _DelayingPageState();
}

class _DelayingPageState extends State<DelayingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenu()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("lib/assets/images/logo_hazir.png"),
              ),
              Lottie.asset("lib/assets/images/loading.json")
            ],
          ),
        )
      ),
    );
  }
}

