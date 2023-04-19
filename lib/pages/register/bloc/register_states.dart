class RegisterStates {
  const RegisterStates(
    this.username,
    this.email,
    this.password,
    this.rePassword,
  );

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
        username ?? this.username,
        email ?? this.email,
        password ?? this.password,
        rePassword ?? this.rePassword,
      );
}
