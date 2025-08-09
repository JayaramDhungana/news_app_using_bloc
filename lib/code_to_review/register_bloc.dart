// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trekking/features/register/bloc/register_event.dart';
// import 'package:trekking/features/register/bloc/register_state.dart';
// import 'package:trekking/services/auth_services.dart';

// class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
//   final AuthService _authService = AuthService();
//   RegisterBloc() : super(RegisterInitial()) {
//     on<RegisterSubmitted>(_onRegisterSubmitted);
//   }


//   Future<void> _onRegisterSubmitted(
//     RegisterSubmitted event,
//     Emitter<RegisterState> emit,
//   ) async {
//     emit(RegisterLoading());
//     if (event.confirmPassword.isEmpty ||
//         event.password.isEmpty ||
//         event.email.isEmpty ||
//         event.fullName.isEmpty) {
//       emit(RegisterFailure('Please fill all the fields'));
//       return;
//     } else if (event.password != event.confirmPassword) {
//       emit(RegisterFailure('Passwords do not match'));
//       return;
//     }
//     try {
//       String result = await _authService.register(
//           name: event.fullName, email: event.email, password: event.password);
//       if (result.contains('successfully')) {
//         emit(RegisterSuccess('User Registered Successfully'));
//       } else {
//         emit(RegisterFailure(result));
//       }
//     } catch (error) {
//       emit(RegisterFailure(error.toString()));
//     }
//   }
// }