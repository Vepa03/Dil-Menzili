import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:http/http.dart' as http;
import 'package:menzil_yoly/Applocale.dart';
import 'package:menzil_yoly/utils/models/teacher_model.dart';
import 'dart:convert';

class Teachers extends StatefulWidget {
  const Teachers({super.key});

  @override
  State<Teachers> createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
  late Future<List<Teacher>> futureTeachers;

  

  @override
  void initState() {
    super.initState();
    futureTeachers = fetchTeachers();
  }

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<List<Teacher>>(
        future: futureTeachers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Öğretmen bulunamadı"));
          } else {
            final teachers = snapshot.data!;
            return ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                final t = teachers[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TeacherDetailPage(teacher: t),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(imageUrl: t.image, width: width*0.9, height: height*0.3, fit: BoxFit.cover,)),
                        Text(t.fullname, style: TextStyle(fontSize: width*0.06, fontWeight: FontWeight.w300),)
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

String getLocalizedDescription(Teacher t, String lang) {
  switch (lang) {
    case 'tr': return t.descriptionTr;
    case 'en': return t.descriptionEn;
    case 'ru': return t.descriptionRu;
    case 'de': return t.descriptionDe;
    case 'tm': return t.descriptionTm;
    default: return t.descriptionEn;
  }
}

Future<List<Teacher>> fetchTeachers() async {
  final url = Uri.parse("http://192.168.100.33:8000/api/teachers/");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) => Teacher.fromJson(item)).toList();
  } else {
    throw Exception("Öğretmenler yüklenemedi");
  }
}


class TeacherDetailPage extends StatelessWidget {
  final Teacher teacher;

  const TeacherDetailPage({super.key, required this.teacher});

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
            title: Center(child: Text(teacher.fullname, style: TextStyle(fontSize: width*0.055, fontWeight: FontWeight.w500),)),
            
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: teacher.image,
                  height: height*0.3,
                  width: width*0.9,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height*0.02),
              Text(teacher.fullname, style: TextStyle(fontSize: width*0.06, fontWeight: FontWeight.w500),),
              Text(teacher.phone, style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.w400),),
              Text(teacher.mail, style: TextStyle(fontSize: width*0.04, fontWeight: FontWeight.w400),),
              SizedBox(height: height*0.05),
              Text(Applocale.experience.getString(context), style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.bold),),
              Text(getLocalizedDescription(teacher, currentLang), style: TextStyle(fontSize: width*0.04),),
            ],
          ),
        ),
      ),
    );
  }
}

