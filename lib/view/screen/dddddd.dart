import 'package:flutter/material.dart';
import 'package:food_delivery/view/screen/onboarding/onboarding.dart';
import 'package:food_delivery/view_model.dart/auth_view_model.dart';
import 'package:provider/provider.dart';


class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('تحقق من البريد')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تم إرسال رابط التحقق إلى بريدك: ${authVM.user?.email}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authVM.reloadUser();
                if (authVM.emailVerified) {
                  // البريد مؤكد → انتقل للـ dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) =>  OnBoarding()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('البريد غير مؤكد بعد. تحقق من الإيميل.'),
                    ),
                  );
                }
              },
              child: const Text('تحقق الآن'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authVM.signOut();
                Navigator.pop(context);
              },
              child: const Text('تسجيل خروج'),
            ),
          ],
        ),
      ),
    );
  }
}
