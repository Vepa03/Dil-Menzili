import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:lottie/lottie.dart';
import 'package:menzil_yoly/Applocale.dart';
import 'package:menzil_yoly/MainMenu.dart';
import 'package:menzil_yoly/ThemeProvider.dart';
import 'package:provider/provider.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
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
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale(
          'en',
          Applocale.EN,
          countryCode: 'US',
          fontFamily: 'Font EN',
        ),
        const MapLocale(
          'km',
          Applocale.KM,
          countryCode: 'KH',
          fontFamily: 'Font KM',
        ),

        const MapLocale( 
          'tr', 
          Applocale.TR,
          countryCode: 'TR',
          fontFamily: 'Font TR'
        ),

        const MapLocale( 
          'de', 
          Applocale.DE,
          countryCode: 'DE',
          fontFamily: 'Font DE'
        ),

        const MapLocale( 
          'ru', 
          Applocale.RU,
          countryCode: 'RU',
          fontFamily: 'Font RU'
        ),

        
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
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

