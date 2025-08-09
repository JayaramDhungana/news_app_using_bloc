// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   late final ValueNotifier<bool> passwordObscure;
//   late final ValueNotifier<bool> confirmObscure;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     passwordObscure = ValueNotifier(true);
//     confirmObscure = ValueNotifier(true);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     fullNameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     passwordObscure.dispose();
//     confirmObscure.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Scaffold(
//           bottomNavigationBar: RotatedBox(
//             quarterTurns: 2,
//             child: CustomClipPath(
//                 height: MediaQuery.of(context).size.height * 0.12),
//           ),
//           body: BlocListener<RegisterBloc, RegisterState>(
//             listener: (context, state) {
//               if (state is RegisterSuccess) {
//                 showSuccessToast(state.message);

//                 Navigator.of(context)
//                     .pushReplacementNamed(RouteName.loginScreen);
//               } else if (state is RegisterFailure) {
//                 showFailToast(state.error);
//               }
//             },
//             child: Stack(
//               children: [
//                 // Background gradient
//                 ClipPath(
//                   clipper: CurvedClipper(),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.4,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [Color(0xFF56935B), Color(0xFF2E7D32)],
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Content
//                 SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(24.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 40),
//                         const Text(
//                           'Create Account',
//                           style: TextStyle(
//                             fontSize: 32,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ).animate().fadeIn(duration: 600.ms).slideX(),
//                         const SizedBox(height: 8),
//                         const Text(
//                           'Sign up to start your adventure',
//                           style: TextStyle(fontSize: 16, color: Colors.white70),
//                         )
//                             .animate()
//                             .fadeIn(duration: 600.ms, delay: 200.ms)
//                             .slideX(),
//                         const SizedBox(height: 40),
//                         _buildRegisterForm(),
//                         const SizedBox(height: 24),
//                         const Center(
//                             child: BuildLogLink(
//                                 text1: 'Already have an account? ',
//                                 text2: 'Log In',
//                                 nav: RouteName.loginScreen)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Align(
//                 //   alignment: Alignment.bottomCenter,
//                 //   child: RotatedBox(
//                 //     quarterTurns: 2,
//                 //     child: CustomClipPath(
//                 //         height: MediaQuery.of(context).size.height * 0.12),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }