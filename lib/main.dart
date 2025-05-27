import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:menzil_yoly/MainMenu.dart';
import 'package:menzil_yoly/ThemeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (context) => ThemeProvider()),
    ],
      child: const MyApp(),)
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
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

