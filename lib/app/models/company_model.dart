class CompanyModel {
  int? id;
  String? companyName;
  String? email;
  String? password;
  String? phone;
  String? createdAt;
  String? updatedAt;

  CompanyModel(
      {this.id,
        this.companyName,
        this.email,
        this.password,
        this.phone,
        this.createdAt,
        this.updatedAt});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name']??'';
    email = json['email']??'';
    password = json['password']??'';
    phone = json['phone']??'';
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_name'] = companyName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}