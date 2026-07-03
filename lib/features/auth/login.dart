import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [

              const SizedBox(height: 30),

              /// Logo
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

                  Icon(
                    Icons.groups,
                    color: Color(0xff2E7D32),
                  ),

                  SizedBox(width: 8),

                  Text(
                    "Community Hub",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B5E20),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 35),

              const Text(
                "Share Kindness",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Log in to start supporting your local initiatives",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 45),

              /// Email
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                decoration: InputDecoration(
                  hintText: "name@example.com",

                  prefixIcon: const Icon(Icons.mail_outline),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [

                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Forgot?",
                    style: TextStyle(
                      color: Color(0xff2E7D32),
                      fontSize: 18,
                    ),
                  )

                ],
              ),

              const SizedBox(height: 12),

              TextField(
                obscureText: obscure,

                decoration: InputDecoration(

                  prefixIcon: const Icon(Icons.lock_outline),

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
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

              /// Login Button
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

                  onPressed: () {},

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

                      SizedBox(width: 10),

                      Icon(
                        Icons.login,
                        color: Colors.white,
                      )

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
                      "OR CONTINUE WITH",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
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
                      "Google",
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: socialButton(
                      FontAwesomeIcons.apple,
                      "Apple",
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

                onPressed: () {},

                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  child: Text(
                    "Create Account",
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
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  children: [

                    TextSpan(
                      text: "By continuing, you agree to our ",
                    ),

                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                        color: Color(0xff2E7D32),
                      ),
                    ),

                    TextSpan(
                      text: " and ",
                    ),

                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Color(0xff2E7D32),
                      ),
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

  Widget socialButton(FaIconData icon, String text) {
    return Container(
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
    );
  }
}