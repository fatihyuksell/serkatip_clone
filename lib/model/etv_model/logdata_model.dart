class LogData {
  int userId;
  int expireTime;
  String token;
  String refreshToken;
  User user;

  LogData(
      {this.userId, this.expireTime, this.token, this.refreshToken, this.user});

  LogData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    expireTime = json['expireTime'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['expireTime'] = this.expireTime;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class LoginToken {
  String accessToken;
  String message;
  String refreshToken;

  LoginToken({this.accessToken, this.message, this.refreshToken});

  LoginToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    message = json['message'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['message'] = this.message;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String userName;
  List<String> roles;
  bool enabled;
  String createdAt;
  String lastLoginDate;

  User(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.userName,
      this.roles,
      this.enabled,
      this.createdAt,
      this.lastLoginDate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    roles = json['roles'].cast<String>();
    enabled = json['enabled'];
    createdAt = json['createdAt'];
    lastLoginDate = json['lastLoginDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userName'] = this.userName;
    data['roles'] = this.roles;
    data['enabled'] = this.enabled;
    data['createdAt'] = this.createdAt;
    data['lastLoginDate'] = this.lastLoginDate;
    return data;
  }
}