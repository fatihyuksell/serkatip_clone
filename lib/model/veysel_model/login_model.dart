class Login {
  String organizationName;
  String username;
  String password;

  Login({this.organizationName, this.username, this.password});

  Login.fromJson(Map<String, dynamic> json) {
    organizationName = json['organization_name'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization_name'] = this.organizationName;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}