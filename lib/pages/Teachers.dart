import 'package:flutter/material.dart';
import 'package:menzil_yoly/utils/models/teacher_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text("Öğretmenler")),
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
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: t.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  title: Text(t.fullname),
                  subtitle: Text(t.descriptionEn),
                );
              },
            );
          }
        },
      ),
    );
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
