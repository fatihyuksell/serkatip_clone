class TokenModel {
  bool fresh;
  int iat;
  String jti;
  String type;
  Sub sub;
  int nbf;
  int exp;

  TokenModel(
      {this.fresh,
      this.iat,
      this.jti,
      this.type,
      this.sub,
      this.nbf,
      this.exp});

  TokenModel.fromJson(Map<String, dynamic> json) {
    fresh = json['fresh'];
    iat = json['iat'];
    jti = json['jti'];
    type = json['type'];
    sub = json['sub'] != null ? new Sub.fromJson(json['sub']) : null;
    nbf = json['nbf'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fresh'] = this.fresh;
    data['iat'] = this.iat;
    data['jti'] = this.jti;
    data['type'] = this.type;
    if (this.sub != null) {
      data['sub'] = this.sub.toJson();
    }
    data['nbf'] = this.nbf;
    data['exp'] = this.exp;
    return data;
  }
}

class Sub {
  String username;
  String organizationName;

  Sub({this.username, this.organizationName});

  Sub.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    organizationName = json['organization_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['organization_name'] = this.organizationName;
    return data;
  }
}