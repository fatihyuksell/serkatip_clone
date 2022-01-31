class Address {
  int id;
  City city;
  City district;
  City town;
  String name;
  String address;
  String direction;
  bool status;

  Address(
      {this.id,
      this.city,
      this.district,
      this.town,
      this.name,
      this.address,
      this.direction,
      this.status});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    district =
        json['district'] != null ? new City.fromJson(json['district']) : null;
    town = json['town'] != null ? new City.fromJson(json['town']) : null;
    name = json['name'];
    address = json['address'];
    direction = json['direction'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district.toJson();
    }
    if (this.town != null) {
      data['town'] = this.town.toJson();
    }
    data['name'] = this.name;
    data['address'] = this.address;
    data['direction'] = this.direction;
    data['status'] = this.status;
    return data;
  }
}

class City {
  int id;
  String name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}