class PersonDetailModel {
  String city;
  String company;
  String createdAt;
  String id;
  String job;
  String name;
  String note;
  String organizationName;
  String phoneNumber;
  String surname;
  String website;

  PersonDetailModel(
      {this.city,
      this.company,
      this.createdAt,
      this.id,
      this.job,
      this.name,
      this.note,
      this.organizationName,
      this.phoneNumber,
      this.surname,
      this.website});

  PersonDetailModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    company = json['company'];
    createdAt = json['created_at'];
    id = json['id'];
    job = json['job'];
    name = json['name'];
    note = json['note'];
    organizationName = json['organization_name'];
    phoneNumber = json['phone_number'];
    surname = json['surname'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['company'] = this.company;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['job'] = this.job;
    data['name'] = this.name;
    data['note'] = this.note;
    data['organization_name'] = this.organizationName;
    data['phone_number'] = this.phoneNumber;
    data['surname'] = this.surname;
    data['website'] = this.website;
    return data;
  }
}