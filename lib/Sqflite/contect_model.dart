class Phones {
  String? image;
  String? name;
  String? city;
  String? id;

  Phones({this.image, this.name, this.city, this.id});

  Phones.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    city = json['city'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['city'] = this.city;
    data['id'] = this.id;
    return data;
  }
}
