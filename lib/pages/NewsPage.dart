import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:http/http.dart' as http;
import 'package:menzil_yoly/Applocale.dart';
import 'package:menzil_yoly/utils/models/news_model.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  late Future<List<News>> futureNews;

  

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    final currentLang = FlutterLocalization.instance.currentLocale?.languageCode ?? 'en';
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
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
            title: Center(child: Text(Applocale.news.getString(context), style: TextStyle(fontSize: width*0.07, fontWeight: FontWeight.bold),)),
            
          ),
        ),
      ),
      body: FutureBuilder<List<News>>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Öğretmen bulunamadı"));
          } else {
            final news = snapshot.data!;
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final newItem = news[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NewDetailPage(news: newItem),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(imageUrl: newItem.image, width: width*0.9, height: height*0.3, fit: BoxFit.cover,)),
                        Text(getLocalizedTitle(newItem, currentLang), style: TextStyle(fontSize: width*0.06, fontWeight: FontWeight.w300),)
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

String getLocalizedDescription(News newItem, String lang) {
  switch (lang) {
    case 'tr': return newItem.descriptionTr;
    case 'en': return newItem.descriptionEn;
    case 'ru': return newItem.descriptionRu;
    case 'de': return newItem.descriptionDe;
    case 'tm': return newItem.descriptionTm;
    default: return newItem.descriptionEn;
  }
}

String getLocalizedTitle(News newItem, String lang) {
  switch (lang) {
    case 'tr': return newItem.titleTr;
    case 'en': return newItem.titleEn;
    case 'ru': return newItem.titleRu;
    case 'de': return newItem.titleDe;
    case 'tm': return newItem.titleTm;
    default: return newItem.titleEn;
  }
}


Future<List<News>> fetchNews() async {
  final url = Uri.parse("http://192.168.100.33:8000/api/news/");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) => News.fromJson(item)).toList();
  } else {
    throw Exception("Öğretmenler yüklenemedi");
  }
}

class NewDetailPage extends StatelessWidget {
  final News news;

  const NewDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final currentLang = FlutterLocalization.instance.currentLocale?.languageCode ?? 'en';
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
            title: Center(child: Text(getLocalizedTitle(news, currentLang), style: TextStyle(fontSize: width*0.055, fontWeight: FontWeight.w500),)),
            
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: news.image,
                      height: height*0.3,
                      width: width*0.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: height*0.02),
                  
                ],
              ),
              Text(getLocalizedDescription(news, currentLang), style: TextStyle(fontSize: width*0.04),),
            ],
          ),
        ),
      ),
    );
  }
}