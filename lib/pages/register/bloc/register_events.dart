abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  const UserNameEvent(this.userName);

  final String userName;
}

class EmailEvent extends RegisterEvent {
  const EmailEvent(this.email);

  final String email;
}

class PasswordEvent extends RegisterEvent {
  const PasswordEvent(this.password);

  final String password;
}

class RePasswordEvent extends RegisterEvent {
  const RePasswordEvent(this.rePassword);

  final String rePassword;
}
