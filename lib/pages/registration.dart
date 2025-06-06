import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:menzil_yoly/Applocale.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final name_controller = TextEditingController();
  final surname_controller = TextEditingController();
  final mail_controller = TextEditingController();
  final number_controller =TextEditingController();
  final subject_controller = TextEditingController();
  final age_controller =TextEditingController();


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // ✅ Form başarılıysa: SnackBar göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(Applocale.snackbar_message.getString(context))),
      );

      // ⏳ 3 saniye bekleyip dialog göster
      Future.delayed(Duration(seconds: 3), () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(Applocale.info.getString(context)),
            content: Text(Applocale.allert_message.getString(context)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(Applocale.close.getString(context)),
              ),
            ],
          ),
        );
      });
    }
  }

  Future<void> register_student() async{
    final url = Uri.parse("http://192.168.100.33:8000/api/student/");

    final response = await http.post(
      url,
      headers:{"Content-Type": "application/json"},
      body: jsonEncode({
        'name': name_controller.text,
        'surname': surname_controller.text,
        'mail': mail_controller.text,
        'phone_number': number_controller.text,
        'subject': subject_controller.text,
        'age': age_controller.text,
      })
    );
    if (response.statusCode == 201) {
      _submitForm();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Hata ${response.statusCode}"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            title: Center(child: Text(Applocale.girish.getString(context), style: TextStyle(fontSize: width*0.07, fontWeight: FontWeight.bold),)),
            
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: width*0.5,
                child: Lottie.asset("lib/assets/images/registration_anime.json")),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child:Column(
                      children: [

                        // ady
                        TextFormField(
                          controller: name_controller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: Applocale.name.getString(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return Applocale.name_allert.getString(context);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height*0.015,),

                        // familyasy
                        TextFormField(
                          controller: surname_controller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            labelText: Applocale.surname.getString(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return Applocale.surname_allert.getString(context);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height*0.015,),

                        // sapagyn ady
                        TextFormField(
                          controller: subject_controller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.school_outlined),
                            labelText: Applocale.subject.getString(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return Applocale.subject_allert.getString(context);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height*0.015,),

                        //yasy 
                        TextFormField(
                          controller: age_controller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_month_outlined),
                            labelText: Applocale.age.getString(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return Applocale.age_allert.getString(context);
                            } 
                            if (value.length>2) {
                              return Applocale.age_allert_2.getString(context);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height*0.015,),

                        // mail address
                        TextFormField(
                          controller: mail_controller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: Applocale.mail.getString(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return Applocale.mail_allert.getString(context);
                            }
                            if (!value.endsWith("@gmail.com")) {
                              return Applocale.mail_allert2.getString(context);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height*0.015,),

                        //telefon nomeri
                        TextFormField(
                          controller: number_controller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_outlined),
                            labelText: Applocale.phone_number.getString(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return Applocale.phonenumber_allert.getString(context);
                            } 
                            if (value.length<7) {
                              return Applocale.phonenumber_allert2.getString(context);
                            }
                            return null;
                          },
                        ),
                        
                        
                        SizedBox(height: 20,),
                        SizedBox(
                          width: width*0.7,
                          height: height*0.05,
                          child: ElevatedButton(onPressed:(){
                            if(_formKey.currentState!.validate()){
                              register_student();
                            }
                          } , 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Theme.of(context).textTheme.titleMedium?.color,
                            
                          ),
                          child: Text(Applocale.girish.getString(context), style: TextStyle(fontSize: width*0.05),)),
                        )
                      ],
                    )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}