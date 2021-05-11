class FoodModels {
  final String name;
  final double price;
  final String desc;
  final String photo;
  final String tags;

  FoodModels({this.desc, this.name, this.photo, this.price, this.tags});
  
  factory FoodModels.fromJson(Map<String, dynamic> json) => FoodModels(
    name: json['name'],
    desc: json['desc'],
    photo: json['photo'],
    price: json['price'],
    tags: json['tags']
  );

}