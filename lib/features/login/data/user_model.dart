class User {
  String id;
  String name;
  String emailId;
  String mobileNumber;
  int countryCode;
  String createdAt;
  String updatedAt;
  List<Roles> roles;
  String token;
  String refreshToken;
  List<String> roleList;
  List<String> privilegeList;
  User(
      {required this.id,
      required this.name,
      required this.emailId,
      required this.mobileNumber,
      required this.countryCode,
      required this.createdAt,
      required this.updatedAt,
      required this.roles,
      required this.token,
      required this.refreshToken,
      required this.roleList,
      required this.privilegeList});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      emailId: json['emailId'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      countryCode: json['countryCode'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      roles: json['roles'] != null
          ? List<Roles>.from(json['roles'].map((v) => Roles.fromJson(v)))
          : [],
      token: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      roleList: json['roleList'] != null
          ? List<String>.from(json['roleList'].map((v) => v))
          : [],
      privilegeList: json['privilegeList'] != null
          ? List<String>.from(json['privilegeList'].map((v) => v))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['emailId'] = this.emailId;
    data['mobileNumber'] = this.mobileNumber;
    data['countryCode'] = this.countryCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['roles'] = this.roles.map((v) => v.toJson()).toList();
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    data['roleList'] = this.roleList;
    data['privilegeList'] = this.privilegeList;
    return data;
  }
}

class Roles {
  String name;
  List<Privileges> privileges;
  UserRole? userRole;

  Roles({
    required this.name,
    required this.privileges,
    this.userRole,
  });

  factory Roles.fromJson(Map<String, dynamic> json) {
    return Roles(
      name: json['name'] ?? '',
      privileges: json['privileges'] != null
          ? List<Privileges>.from(
              json['privileges'].map((v) => Privileges.fromJson(v)))
          : [],
      userRole:
          json['UserRole'] != null ? UserRole.fromJson(json['UserRole']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['privileges'] = this.privileges.map((v) => v.toJson()).toList();
    if (this.userRole != null) {
      data['UserRole'] = this.userRole!.toJson();
    }
    return data;
  }
}

class Privileges {
  String name;
  String slug;

  Privileges({
    required this.name,
    required this.slug,
  });

  factory Privileges.fromJson(Map<String, dynamic> json) {
    return Privileges(
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class UserRole {
  String id;
  String roleId;
  String userId;
  String createdAt;
  String updatedAt;

  UserRole({
    required this.id,
    required this.roleId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      id: json['id'] ?? '',
      roleId: json['roleId'] ?? '',
      userId: json['userId'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roleId'] = this.roleId;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

// With Nullable Values

// class User {
//   String? id;
//   String? name;
//   String? emailId;
//   String? mobileNumber;
//   int? countryCode;
//   String? createdAt;
//   String? updatedAt;
//   List<Roles>? roles;
//   String? token;
//   String? refreshToken;

//   User(
//       {this.id,
//       this.name,
//       this.emailId,
//       this.mobileNumber,
//       this.countryCode,
//       this.createdAt,
//       this.updatedAt,
//       this.roles,
//       this.token,
//       this.refreshToken});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     emailId = json['emailId'];
//     mobileNumber = json['mobileNumber'];
//     countryCode = json['countryCode'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     if (json['roles'] != null) {
//       roles = <Roles>[];
//       json['roles'].forEach((v) {
//         roles!.add(new Roles.fromJson(v));
//       });
//     }
//     token = json['token'];
//     refreshToken = json['refreshToken'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['emailId'] = this.emailId;
//     data['mobileNumber'] = this.mobileNumber;
//     data['countryCode'] = this.countryCode;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     if (this.roles != null) {
//       data['roles'] = this.roles!.map((v) => v.toJson()).toList();
//     }
//     data['token'] = this.token;
//     data['refreshToken'] = this.refreshToken;
//     return data;
//   }
// }

// class Roles {
//   String? name;
//   List<Privileges>? privileges;
//   UserRole? userRole;

//   Roles({this.name, this.privileges, this.userRole});

//   Roles.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     if (json['privileges'] != null) {
//       privileges = <Privileges>[];
//       json['privileges'].forEach((v) {
//         privileges!.add(new Privileges.fromJson(v));
//       });
//     }
//     userRole = json['UserRole'] != null
//         ? new UserRole.fromJson(json['UserRole'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     if (this.privileges != null) {
//       data['privileges'] = this.privileges!.map((v) => v.toJson()).toList();
//     }
//     if (this.userRole != null) {
//       data['UserRole'] = this.userRole!.toJson();
//     }
//     return data;
//   }
// }

// class Privileges {
//   String? name;
//   String? slug;

//   Privileges({this.name, this.slug});

//   Privileges.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     slug = json['slug'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     return data;
//   }
// }

// class UserRole {
//   String? id;
//   String? roleId;
//   String? userId;
//   String? createdAt;
//   String? updatedAt;

//   UserRole({
//     this.id,
//     this.roleId,
//     this.userId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   UserRole.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     roleId = json['roleId'];
//     userId = json['userId'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     roleId = json['RoleId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['roleId'] = this.roleId;
//     data['userId'] = this.userId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['RoleId'] = this.roleId;
//     return data;
//   }
// }
