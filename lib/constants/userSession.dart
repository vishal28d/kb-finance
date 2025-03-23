class UserSession {
  static final UserSession _singleton = UserSession._internal();
  UserRole? role;

  factory UserSession() {
    return _singleton;
  }

  UserSession._internal();
}

// Enum for UserRole
enum UserRole { customer, banker }
