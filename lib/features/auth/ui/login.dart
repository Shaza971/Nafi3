import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nafi3_project/features/auth/ui/signup.dart';
import 'package:nafi3_project/features/auth/data/auth_repo.dart';
import 'package:nafi3_project/features/home/ui/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthRepo authRepo = AuthRepo();

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

Future<void> signIn() async {
  if (emailController.text.trim().isEmpty ||
      passwordController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please fill all fields"),
      ),
    );
    return;
  }

  try {
    await authRepo.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (_) => Home(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    //إذا حدث خطأ من Firebase.

// مثل:
// كلمة السر خطأ
// المستخدم غير موجود
// البريد الإلكتروني غير صالح

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.message ?? "Login Failed"),
      ),
    );
  }
}





 Future<void> googleLogin() async {
    try {
      final user = await authRepo.signInWithGoogle();

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Home(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Google Login Failed"),
        ),
      );
    }
  }

  bool obscure = true;   
  //هذا المتغير مسئول عن إظهار وإخفاء كلمة السر.
  bool isLoading = false;
  //هذا المتغير يستخدم لإظهار مؤشر تحميل.....


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 95,
                height: 95,
                decoration: const BoxDecoration(
                  color: Color(0xff2E7D32),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 45,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.groups, color: Color(0xff2E7D32)),
                  SizedBox(width: 8),
                  Text(
                    'Community Hub',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B5E20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Text(
                'Share Kindness',
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Log in to start supporting your local initiatives',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 45),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(

                  hintText: "name@example.com",

                  prefixIcon: const Icon(Icons.mail_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),

              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Forgot?',
                    style: TextStyle(
                      color: Color(0xff2E7D32),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: obscure,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() => obscure = !obscure);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                  
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2E7D32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),

                  onPressed: () async {
                    await signIn();
                  },

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR CONTINUE WITH',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 35),
          Row(
  children: [
    Expanded(
      child: socialButton(
        FontAwesomeIcons.google,
        'Google',
        onTap: () async {
          await googleLogin();
        },
      ),
    ),
    const SizedBox(width: 20),
    Expanded(
      child: socialButton(
        FontAwesomeIcons.apple,
        'Apple',
      ),
    ),
  ],
),
             
              const SizedBox(height: 40),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signupscreen(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color(0xff2E7D32),
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  children: [
                    TextSpan(text: 'By continuing, you agree to our '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(color: Color(0xff2E7D32)),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Color(0xff2E7D32)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        ),
    );
  }


  Widget socialButton(
  FaIconData icon,
  String text, {
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(35),
    child: Container(
      height: 58,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}







  // Widget socialButton(FaIconData icon, String text) {
  //   return Container(
  //     height: 58,
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey.shade300),
  //       borderRadius: BorderRadius.circular(35),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         FaIcon(icon, size: 20),
  //         const SizedBox(width: 10),
  //         Text(text, style: const TextStyle(fontSize: 18)),
  //       ],
  //     ),
  //   );
  // }
}
