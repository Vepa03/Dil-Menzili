import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:http/http.dart' as http;
import 'package:menzil_yoly/Applocale.dart';
import 'package:menzil_yoly/pages/registration.dart';
import 'package:menzil_yoly/utils/models/courses_model.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  late Future<List<Courses>> futureCourses;

  

  @override
  void initState() {
    super.initState();
    futureCourses = fetchCourses();
  }
  @override
  Widget build(BuildContext context) {
    final currentLang = FlutterLocalization.instance.currentLocale?.languageCode ?? 'en';
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<List<Courses>>(
        future: futureCourses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Öğretmen bulunamadı"));
          } else {
            final courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CourseDetailPage(courses: course),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(imageUrl: course.image, width: width*0.9, height: height*0.3, fit: BoxFit.cover,)),
                        Text(getLocalizedTitle(course, currentLang), style: TextStyle(fontSize: width*0.06, fontWeight: FontWeight.w300),)
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

String getLocalizedDescription(Courses course, String lang) {
  switch (lang) {
    case 'tr': return course.descriptionTr;
    case 'en': return course.descriptionEn;
    case 'ru': return course.descriptionRu;
    case 'de': return course.descriptionDe;
    case 'tm': return course.descriptionTm;
    default: return course.descriptionEn;
  }
}

String getLocalizedTitle(Courses course, String lang) {
  switch (lang) {
    case 'tr': return course.titleTr;
    case 'en': return course.titleEn;
    case 'ru': return course.titleRu;
    case 'de': return course.titleDe;
    case 'tm': return course.titleTm;
    default: return course.titleEn;
  }
}


Future<List<Courses>> fetchCourses() async {
  final url = Uri.parse("http://192.168.100.33:8000/api/courses/");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) => Courses.fromJson(item)).toList();
  } else {
    throw Exception("Öğretmenler yüklenemedi");
  }
}

class CourseDetailPage extends StatelessWidget {
  final Courses courses;

  const CourseDetailPage({super.key, required this.courses});

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
            title: Center(child: Text(getLocalizedTitle(courses, currentLang), style: TextStyle(fontSize: width*0.055, fontWeight: FontWeight.w500),)),
            
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
                      imageUrl: courses.image,
                      height: height*0.3,
                      width: width*0.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: height*0.02),
                  SizedBox(
                    width: width*0.7,
                    height: height*0.05,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Registration()));
                    }, 
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    child: Text(Applocale.girish.getString(context), style: TextStyle(fontSize: width*0.05),)),
                  ),
                ],
              ),
              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Applocale.trial.getString(context), style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.w500), textAlign: TextAlign.start,),
                      Text("${Applocale.price.getString(context)}${courses.price}", style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.w300),),
                      Text("${Applocale.duration.getString(context)}${courses.duration}", style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.w400),),
                    ],
                  ),
                  SizedBox(height: height*0.05),
              
                  Text(Applocale.about_course.getString(context), style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.bold),),
                  Text(getLocalizedDescription(courses, currentLang), style: TextStyle(fontSize: width*0.04),),
            ],
          ),
        ),
      ),
    );
  }
}