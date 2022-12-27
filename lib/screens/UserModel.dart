class UserModel {
  String? companyName;
  String? countryCode;
  String? notificationSent;
  String? image;
  var status;
  String? rememberToken;
  String? mailSent;
  String? isApproved;
  String? teamConnected;
  String? forgotPasswordHash;
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  num? otp;
  num? isVerify;
  var role;
  num? supervisorId;
  String? countryFlag;
  String? deviceToken;
  String? deviceType;
  String? updatedAt;
  String? createdAt;
  String? token;
  String? old_password;
  String? new_password;
  UserModel? user;

  UserModel({
    this.companyName,
    this.countryCode,
    this.notificationSent,
    this.image,
    this.status,
    this.rememberToken,
    this.mailSent,
    this.isApproved,
    this.teamConnected,
    this.forgotPasswordHash,
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.otp,
    this.isVerify,
    this.role,
    this.supervisorId,
    this.countryFlag,
    this.deviceToken,
    this.deviceType,
    this.updatedAt,
    this.token,
    this.createdAt,
    this.old_password,
    this.new_password,
    this.user,
  });

  UserModel.fromJson(dynamic json) {
    companyName = json['company_name'];
    countryCode = json['country_code'];
    notificationSent = json['notification_sent'];
    image = json['image'];
    status = json['status'];
    rememberToken = json['rememberToken'];
    mailSent = json['mail_sent'];
    isApproved = json['is_approved'];
    teamConnected = json['team_connected'];
    forgotPasswordHash = json['forgotPasswordHash'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    otp = json['otp'];
    isVerify = json['is_verify'];
    role = json['role'];
    supervisorId = json['supervisor_id'];
    countryFlag = json['country_flag'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    token = json['token'];
    old_password = json['old_password'];
    new_password = json['new_password'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    void writeNotNull(String key, dynamic value) {
      if (value != null && value.toString().isNotEmpty) {
        data[key] = value;
      }
    }

    writeNotNull('company_name', companyName);
    writeNotNull('country_code', countryCode);
    writeNotNull('notification_sent', notificationSent);
    writeNotNull('image', image);
    writeNotNull('status', status);
    writeNotNull('rememberToken', rememberToken);
    writeNotNull('mail_sent', mailSent);
    writeNotNull('is_approved', isApproved);
    writeNotNull('team_connected', teamConnected);
    writeNotNull('forgotPasswordHash', forgotPasswordHash);
    writeNotNull('id', id);
    writeNotNull('name', name);
    writeNotNull('email', email);
    writeNotNull('password', password);
    writeNotNull('phone', phone);
    writeNotNull('otp', otp);
    writeNotNull('is_verify', isVerify);
    writeNotNull('role', role);
    writeNotNull('supervisor_id', supervisorId);
    writeNotNull('country_flag', countryFlag);
    writeNotNull('device_token', deviceToken);
    writeNotNull('device_type', deviceType);
    writeNotNull('updatedAt', updatedAt);
    writeNotNull('createdAt', createdAt);
    writeNotNull('token', token);
    writeNotNull('old_password', old_password);
    writeNotNull('new_password', new_password);
    writeNotNull('user', user?.toJson());
    return data;
  }
}
