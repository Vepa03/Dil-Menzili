class News {
  final int id;
  final String titleEn;
  final String titleTm;
  final String titleTr;
  final String titleRu;
  final String titleDe;
  final String descriptionEn;
  final String descriptionTm;
  final String descriptionTr;
  final String descriptionRu;
  final String descriptionDe;
  final String image;

  News({
    required this.id,
    required this.titleEn,
    required this.titleTm,
    required this.titleTr,
    required this.titleRu,
    required this.titleDe,
    required this.descriptionEn,
    required this.descriptionTm,
    required this.descriptionTr,
    required this.descriptionRu,
    required this.descriptionDe,
    required this.image,


  });

  factory News.fromJson(Map<String, dynamic>json){
    return News(
      id: json['id'], 
      titleEn: json['title_en'], 
      titleTm: json['title_tm'], 
      titleTr: json['title_tr'], 
      titleRu: json['title_ru'], 
      titleDe: json['title_de'], 
      descriptionEn: json['description_en'], 
      descriptionTm: json['description_tm'], 
      descriptionTr: json['description_tr'], 
      descriptionRu: json['description_ru'], 
      descriptionDe: json['description_de'], 
      image: json['image']);
  }
}

