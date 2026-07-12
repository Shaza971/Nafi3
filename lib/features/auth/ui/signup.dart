import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafi3_project/core/widget/textfield.dart';
import 'package:nafi3_project/features/auth/data/auth_repo.dart';
import 'package:nafi3_project/features/auth/data/firestore_repo.dart';
import 'package:nafi3_project/features/home/ui/home.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final AuthRepo authRepo = AuthRepo();
  final FirestoreRepo firestoreRepo = FirestoreRepo();

  Future<void> signUp() async {
    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please accept Terms of Service"),
        ),
      );
      return;
    }

    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    try {
     
      final userCredential = await authRepo.signUp(
  emailController.text.trim(),
  passwordController.text.trim(),
);

await firestoreRepo.saveUser(
  uid: userCredential.user!.uid,
  name: nameController.text.trim(),
  email: emailController.text.trim(),
);

Navigator.pushReplacement(
  // ignore: use_build_context_synchronously
  context,
  MaterialPageRoute(
    builder: (_) => Home(),
  ),
);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Registration Failed"),
        ),
      );
    }
  }

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController =
    TextEditingController();
  bool isChecked = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.green,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.groups, color: Colors.green),
                  const SizedBox(width: 8),
                  const Text(
                    'Community Hub',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 35),
                ],
              ),
              const SizedBox(height: 25),
              Center(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.eco,
                    size: 55,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  'Join Our Community',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Connect with causes you care about and\nstart making a real difference today.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: nameController,
                label: 'Full Name',
                hint: 'John Doe',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                label: 'Email Address',
                hint: 'email@example.com',
                icon: Icons.email_outlined,
                
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                hint: '********',
                icon: Icons.lock_outline,
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(() => obscurePassword = !obscurePassword);
                  },
                ),
               
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: confirmPasswordController,
                label: 'Confirm Password',
                hint: '********',
                icon: Icons.lock_outline,
                obscureText: obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(
                      () => obscureConfirmPassword = !obscureConfirmPassword,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              terms(
                isChecked,
                (value) {
                  setState(() => isChecked = value ?? false);
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: appbutton('Create Account', context),
              ),
              const SizedBox(height: 25),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: 16),
                      children: const [
                        TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


/////////////////////////widgets/////////////////////////



  Widget appbutton(String buttonname, BuildContext context) {
    return GestureDetector(

     onTap: () async {
  await signUp();
    },

      child: Container(
        decoration: BoxDecoration(
          color: isLoading ? Colors.green.shade300 : Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  buttonname,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }

  Widget terms(bool isChecked, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Checkbox(
         value: isChecked,
         activeColor: Colors.green,
         onChanged: onChanged,),
            
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: 14),
              children: const [
                TextSpan(text: 'I agree to the '),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}