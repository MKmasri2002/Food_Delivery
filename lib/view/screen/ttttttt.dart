import 'package:flutter/material.dart';
import 'package:food_delivery/view/screen/dddddd.dart';
import 'package:food_delivery/view_model.dart/auth_view_model.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Email Auth')),
      body: Center(
        child: authVM.isLoggedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('مرحباً، ${authVM.user!.email}'),
                  if (!authVM.user!.emailVerified)
                    const Text(
                      'لم يتم تأكيد البريد الإلكتروني بعد',
                      style: TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => authVM.signOut(),
                    child: const Text('تسجيل خروج'),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'البريد الإلكتروني',
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'كلمة المرور',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final message = await authVM.signUpWithEmail(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        if (message != null) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم إنشاء الحساب، تحقق من بريدك'),
                            ),
                          );
                        }
                      },
                      child: const Text('إنشاء حساب جديد'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final message = await authVM.signUpWithEmail(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        if (message != null) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        } else {
                          // بعد إنشاء الحساب، اذهب لصفحة التحقق
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VerifyEmailPage(),
                            ),
                          );
                        }
                      },
                      child: const Text('إنشاء حساب جديد'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
