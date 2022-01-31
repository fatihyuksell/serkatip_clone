class Nelerdahil {
  int id;
  String slug;
  String content;

  Nelerdahil({this.id, this.slug, this.content});

  Nelerdahil.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['content'] = this.content;
    return data;
  }
}