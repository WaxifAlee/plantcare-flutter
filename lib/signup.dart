import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:plantpal/appcolors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<void> _signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The accound already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
              left: 24, right: 24, top: MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  icon: const Icon(Icons.arrow_back_outlined, size: 28),
                  padding: EdgeInsets.zero,
                ),
                const SizedBox(height: 30),
                Text(
                  'Hello there 👋',
                  style: GoogleFonts.urbanist(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                  ).copyWith(
                    color: AppColors.kGreyScale900,
                  ),
                ),
                Text(
                  'Please enter your email & password to create an account.',
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ).copyWith(
                    color: AppColors.kGreyScale900,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Email',
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ).copyWith(
                    color: AppColors.kGreyScale900,
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    suffixIcon: Icon(
                      Icons.message,
                      size: 28,
                      color: AppColors.kGreyScale900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Full Name',
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ).copyWith(
                    color: AppColors.kGreyScale900,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    suffixIcon: Icon(
                      Icons.person,
                      size: 28,
                      color: AppColors.kGreyScale900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ).copyWith(
                    color: AppColors.kGreyScale900,
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Password', suffixIcon: Icon(Icons.visibility)),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SimpleCheckBox(
                      checked: true,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the ',
                              style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.6,
                                letterSpacing: 0.2,
                              ).copyWith(
                                color: AppColors.kGreyScale900,
                              ),
                            ),
                            TextSpan(
                              text: 'PlantPal Terms & Privacy Policy.',
                              style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.6,
                                letterSpacing: 0.2,
                              ).copyWith(
                                color: AppColors.kPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimary,
                        minimumSize: const Size(180, 58),
                        foregroundColor: AppColors.kWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
                const Divider(color: AppColors.kGreyScale200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ).copyWith(
                        color: AppColors.kGreyScale900,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/signin');
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.6,
                          letterSpacing: 0.2,
                        ).copyWith(
                          color: AppColors.kPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.onTap,
    required this.label,
    this.color,
    this.width,
    this.height,
    this.style,
    super.key,
  });
  final void Function() onTap;
  final String label;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: (height ?? 58),
        decoration: BoxDecoration(
          color: color ?? AppColors.kPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: style ??
              GoogleFonts.urbanist(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.6,
                letterSpacing: 0.2,
              ).copyWith(
                color: AppColors.kWhite,
              ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SimpleCheckBox extends StatefulWidget {
  SimpleCheckBox({required this.checked, super.key});
  bool checked;

  @override
  State<SimpleCheckBox> createState() => _SimpleCheckBoxState();
}

class _SimpleCheckBoxState extends State<SimpleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox.adaptive(
        activeColor: AppColors.kPrimary,
        checkColor: AppColors.kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(color: AppColors.kPrimary, width: 2.75),
        value: widget.checked,
        onChanged: (checked) {
          setState(() {
            widget.checked = checked ?? false;
          });
        },
      ),
    );
  }
}
