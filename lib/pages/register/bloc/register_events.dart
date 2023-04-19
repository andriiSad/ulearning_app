abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  const UserNameEvent(this.userName);

  final String userName;
}
