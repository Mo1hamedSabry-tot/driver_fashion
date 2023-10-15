import 'dart:developer';

class UserDataModel {
  String? storeId;
  String? memberId;
  bool? isAdministrator;
  String? photoUrl;
  String? userType;
  String? status;
  String? password;
  DateTime? createdDate;
  DateTime? modifiedDate;
  String? createdBy;
  String? modifiedBy;
  List<Role>? roles;
  List<Login>? logins;
  bool? passwordExpired;
  DateTime? lastPasswordChangedDate;
  DateTime? lastPasswordChangeRequestDate;
  DateTime? lastLoginDate;
  String id;
  String userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  DateTime? lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  UserDataModel({
    this.storeId,
    this.memberId,
    this.isAdministrator,
    this.photoUrl,
    this.userType,
    this.status,
    this.password,
    this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
    this.roles,
    this.logins,
    this.passwordExpired,
    this.lastPasswordChangedDate,
    this.lastPasswordChangeRequestDate,
    this.lastLoginDate,
    required this.id,
    required this.userName,
    this.normalizedUserName,
    this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      // storeId: json['storeId'],
      // memberId: json['memberId'],
      // isAdministrator: json['isAdministrator'],
      photoUrl: json['photoUrl'],
      // userType: json['userType'],
      // status: json['status'],
      // password: json['password'],
      // createdDate: DateTime.tryParse(json['createdDate']),
      // modifiedDate: DateTime.tryParse(json['modifiedDate']),
      // createdBy: json['createdBy'],
      // modifiedBy: json['modifiedBy'],
      // roles: json['roles'] != null
      //     ? List<Role>.from(json['roles'].map((role) => Role.fromJson(role)))
      //     : null,
      // logins: json['logins'] != null
      //     ? List<Login>.from(
      //         json['logins'].map((login) => Login.fromJson(login)))
      //     : null,
      // passwordExpired: json['passwordExpired'],
      // lastPasswordChangedDate:
      //     DateTime.tryParse(json['lastPasswordChangedDate']),
      // lastPasswordChangeRequestDate:
      //     DateTime.tryParse(json['lastPasswordChangeRequestDate']),
      // lastLoginDate: DateTime.tryParse(json['lastLoginDate']),
      id: json['id'],
      userName: json['userName'],
      // normalizedUserName: json['normalizedUserName'],
      // email: json['email'],
      // normalizedEmail: json['normalizedEmail'],
      // emailConfirmed: json['emailConfirmed'],
      // passwordHash: json['passwordHash'],
      // securityStamp: json['securityStamp'],
      // concurrencyStamp: json['concurrencyStamp'],
      phoneNumber: json['phoneNumber'],
      // phoneNumberConfirmed: json['phoneNumberConfirmed'],
      // twoFactorEnabled: json['twoFactorEnabled'],
      // lockoutEnd: DateTime.tryParse(json['lockoutEnd']),
      // lockoutEnabled: json['lockoutEnabled'],
      // accessFailedCount: json['accessFailedCount'],
    );
  }
}

class Role {
  String? description;
  List<Permission>? permissions;
  String? id;
  String? name;
  String? normalizedName;
  String? concurrencyStamp;

  Role({
    this.description,
    this.permissions,
    this.id,
    this.name,
    this.normalizedName,
    this.concurrencyStamp,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      description: json['description'],
      permissions: json['permissions'] != null
          ? List<Permission>.from(json['permissions']
              .map((permission) => Permission.fromJson(permission)))
          : null,
      id: json['id'],
      name: json['name'],
      normalizedName: json['normalizedName'],
      concurrencyStamp: json['concurrencyStamp'],
    );
  }
}

class Permission {
  String? name;
  String? moduleId;
  String? groupName;
  List<Scope>? assignedScopes;
  List<Scope>? availableScopes;

  Permission({
    this.name,
    this.moduleId,
    this.groupName,
    this.assignedScopes,
    this.availableScopes,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      name: json['name'],
      moduleId: json['moduleId'],
      groupName: json['groupName'],
      assignedScopes: json['assignedScopes'] != null
          ? List<Scope>.from(
              json['assignedScopes'].map((scope) => Scope.fromJson(scope)))
          : null,
      availableScopes: json['availableScopes'] != null
          ? List<Scope>.from(
              json['availableScopes'].map((scope) => Scope.fromJson(scope)))
          : null,
    );
  }
}

class Scope {
  String? type;
  String? label;
  String? scope;

  Scope({
    this.type,
    this.label,
    this.scope,
  });

  factory Scope.fromJson(Map<String, dynamic> json) {
    return Scope(
      type: json['type'],
      label: json['label'],
      scope: json['scope'],
    );
  }
}

class Login {
  String? loginProvider;
  String? providerKey;

  Login({
    this.loginProvider,
    this.providerKey,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      loginProvider: json['loginProvider'],
      providerKey: json['providerKey'],
    );
  }
}
