class Cleaning {
  int id;
  String type;
  String name;
  String slug;
  String icon;
  List<ProductFrequencies> productFrequencies;
  Size size;
  Size extra;
  Size package;
  Size food;
  String color;

  Cleaning(
      {this.id,
      this.type,
      this.name,
      this.slug,
      this.icon,
      this.productFrequencies,
      this.size,
      this.extra,
      this.package,
      this.food,
      this.color});

  Cleaning.fromJson(Map<String, dynamic> json) {
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
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    extra = json['extra'] != null ? new Size.fromJson(json['extra']) : null;
    package =
        json['package'] != null ? new Size.fromJson(json['package']) : null;
    food = json['food'] != null ? new Size.fromJson(json['food']) : null;
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
    if (this.size != null) {
      data['size'] = this.size.toJson();
    }
    if (this.extra != null) {
      data['extra'] = this.extra.toJson();
    }
    if (this.package != null) {
      data['package'] = this.package.toJson();
    }
    if (this.food != null) {
      data['food'] = this.food.toJson();
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

class Size {
  String title;
  String icon;
  String chose;
  List<Options> options;

  Size({this.title, this.icon, this.chose, this.options});

  Size.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    chose = json['chose'];
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['chose'] = this.chose;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int id;
  String name;
  String icon;
  int price;
  String paymentName;
  bool isDefault;

  Options(
      {this.id,
      this.name,
      this.icon,
      this.price,
      this.paymentName,
      this.isDefault});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    price = json['price'];
    paymentName = json['paymentName'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['price'] = this.price;
    data['paymentName'] = this.paymentName;
    data['isDefault'] = this.isDefault;
    return data;
  }
}