abstract class RegisterEvent {}

class FullNameChanged extends RegisterEvent {
  final String fullName;
  FullNameChanged(this.fullName);
}

class EmailChanged extends RegisterEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged(this.password);
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);
}

class RegisterSubmitted extends RegisterEvent {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  RegisterSubmitted(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.confirmPassword});
}