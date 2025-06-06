class Courses {
  final int id;
  final String titleEn;
  final String titleTm;
  final String titleTr;
  final String titleRu;
  final String titleDe;
  final String price;
  final String duration;
  final String descriptionEn;
  final String descriptionTm;
  final String descriptionTr;
  final String descriptionRu;
  final String descriptionDe;
  final String image;

  Courses({
    required this.id,
    required this.titleEn,
    required this.titleTm,
    required this.titleTr,
    required this.titleRu,
    required this.titleDe,
    required this.price,
    required this.duration,
    required this.descriptionEn,
    required this.descriptionTm,
    required this.descriptionTr,
    required this.descriptionRu,
    required this.descriptionDe,
    required this.image,


  });

  factory Courses.fromJson(Map<String, dynamic>json){
    return Courses(
      id: json['id'], 
      titleEn: json['title_en'], 
      titleTm: json['title_tm'], 
      titleTr: json['title_tr'], 
      titleRu: json['title_ru'], 
      titleDe: json['title_de'], 
      price: json['price'],
      duration: json['duration'],
      descriptionEn: json['description_en'], 
      descriptionTm: json['description_tm'], 
      descriptionTr: json['description_tr'], 
      descriptionRu: json['description_ru'], 
      descriptionDe: json['description_de'], 
      image: json['image']);
  }
}

