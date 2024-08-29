import 'package:classroom_flutter/core/constants/app_colors.dart';
import 'package:classroom_flutter/features/authentication/presentation/providers/auth_provider.dart';
import 'package:classroom_flutter/features/authentication/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';
import 'package:password_strength/password_strength.dart';

enum AuthenType { isLogin, isSignup }

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthenType _selected = AuthenType.isLogin;

  @override
  void initState() {
    super.initState();
    // No need for manual navigation; GoRouter will handle it
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return DefaultTabController(
      length: 2, // Number of tabs
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Welcome to Classroom',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SegmentedButton(
                    emptySelectionAllowed: false,
                    segments: const [
                      ButtonSegment(
                          value: AuthenType.isLogin,
                          label: Text("Login",
                              style: TextStyle(color: Colors.black))),
                      ButtonSegment(
                          value: AuthenType.isSignup,
                          label: Text("Sign Up",
                              style: TextStyle(color: Colors.black))),
                    ],
                    selected: <AuthenType>{_selected},
                    onSelectionChanged: (p0) {
                      setState(() {
                        _selected = p0.first;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        ValidationBuilder().email().maxLength(50).build(),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return "The field is required!";
                      }
                      if (estimatePasswordStrength(value) < 0.3) {
                        return "The password is weak! Set a strong password.";
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                      text:
                          _selected == AuthenType.isLogin ? "Login" : "Sign Up",
                      color: Colors.white,
                      onPressed: () async {
                        if (_selected == AuthenType.isLogin) {
                          await ref
                              .read(authProvider.notifier)
                              .loginWithEmailAndPassword(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  context);
                        } else {
                          await ref.read(authProvider.notifier).createUser(
                              emailController.text.trim(),
                              passwordController.text.trim());
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
