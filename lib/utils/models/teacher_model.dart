class Teacher {
  final int id;
  final String fullname;
  final String phone;
  final String mail;
  final String descriptionEn;
  final String descriptionTm;
  final String descriptionTr;
  final String descriptionRu;
  final String descriptionDe;
  final String image;

  Teacher({
    required this.id,
    required this.fullname,
    required this.phone,
    required this.mail,
    required this.descriptionEn,
    required this.descriptionTm,
    required this.descriptionTr,
    required this.descriptionRu,
    required this.descriptionDe,
    required this.image,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      fullname: json['fullname'],
      phone: json['phone'],
      mail: json['mail'],
      descriptionEn: json['description_en'],
      descriptionTm: json['description_tm'],
      descriptionTr: json['description_tr'],
      descriptionRu: json['description_ru'],
      descriptionDe: json['description_de'],

      image: json['image'],
    );
  }
}
