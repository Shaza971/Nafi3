import 'package:flutter/material.dart';
import 'package:nafi3_project/core/widget/textfield.dart';
import 'package:nafi3_project/features/home/home.dart';


class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  bool isChecked = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),

              /// Header
              Row(
                children: [

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.green,
                    ),
                  ),

                  const Spacer(),

                  const Icon(
                    Icons.groups,
                    color: Colors.green,
                  ),

                  const SizedBox(width: 8),

                  const Text(
                    "Community Hub",
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

              /// Image
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
                  "Join Our Community",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "Connect with causes you care about and\nstart making a real difference today.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              CustomTextField(
                label: "Full Name",
                hint: "John Doe",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Email Address",
                hint: "email@example.com",
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Password",
                hint: "********",
                icon: Icons.lock_outline,
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Confirm Password",
                hint: "********",
                icon: Icons.lock_outline,
                obscureText: obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureConfirmPassword =
                          !obscureConfirmPassword;
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),

              terms(
                 isChecked, (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: appbutton( "Create Account",context),
              ),

              const SizedBox(height: 25),

              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                    children: [

                      TextSpan(
                        text: "Already have an account? ",
                      ),

                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
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
}
/////////////////////////widgets/////////////////////////

  Widget appbutton (String buttonname,BuildContext context) {
    return GestureDetector(
      onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Home()),
      
            );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        width: 360,
        child: Center(child: Text(buttonname,style: TextStyle(
          color: Colors.white,
        ),),),
      ),
    );
  }
  

  Widget terms(bool isChecked, onChanged) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: Colors.green,
          onChanged: (value) {
              isChecked = value!;
            }),
            

        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              children: [
                TextSpan(text: "I agree to the "),
                TextSpan(
                  text: "Terms of Service",
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
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
