class Model {
  String? region;
  String? subregion;
  String? flag;

  Model(
      {
        this.region,
        this.subregion,
        this.flag,
      });

  Model.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    subregion = json['subregion'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    data['flag'] = this.flag;
    return data;
  }
}
