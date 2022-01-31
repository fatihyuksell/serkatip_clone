class ProductsModel {
  int id;
  String type;
  String name;
  String slug;
  String icon;
  List<ProductFrequencies> productFrequencies;
  String color;

  ProductsModel(
      {this.id,
      this.type,
      this.name,
      this.slug,
      this.icon,
      this.productFrequencies,
      this.color});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    if (json['productFrequencies'] != null) {
      productFrequencies = new List<ProductFrequencies>();
      json['productFrequencies'].forEach((v) {
        productFrequencies.add(new ProductFrequencies.fromJson(v));
      });
    }
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    if (this.productFrequencies != null) {
      data['productFrequencies'] =
          this.productFrequencies.map((v) => v.toJson()).toList();
    }
    data['color'] = this.color;
    return data;
  }
}

class ProductFrequencies {
  String name;
  int recurringDayValue;
  bool isDefault;
  String code;
  bool visible;

  ProductFrequencies(
      {this.name,
      this.recurringDayValue,
      this.isDefault,
      this.code,
      this.visible});

  ProductFrequencies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    recurringDayValue = json['recurringDayValue'];
    isDefault = json['isDefault'];
    code = json['code'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['recurringDayValue'] = this.recurringDayValue;
    data['isDefault'] = this.isDefault;
    data['code'] = this.code;
    data['visible'] = this.visible;
    return data;
  }
}