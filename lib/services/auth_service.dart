import 'dart:async';

class AuthUser {
  final String email;
  const AuthUser(this.email);
}

class AuthService {
  AuthUser? _currentUser;

  AuthUser? get currentUser => _currentUser;

  Future<AuthUser> signIn({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));

    final okEmail = email.trim().contains('@');
    final okPassword = password == 'ilovegdg123' || password.length >= 8;

    if (!okEmail || !okPassword) {
      throw AuthException('Invalid email or password.');
    }

    _currentUser = AuthUser(email.trim());
    return _currentUser!;
  }

  void signOut() {
    _currentUser = null;
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}