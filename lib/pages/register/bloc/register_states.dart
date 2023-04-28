class RegisterStates {
  const RegisterStates({
    this.username = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',
  });

  final String username;
  final String email;
  final String password;
  final String rePassword;

  RegisterStates copyWith({
    String? username,
    String? email,
    String? password,
    String? rePassword,
  }) =>
      RegisterStates(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword,
      );
}
