// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/dashboard.dart';
import 'package:plantpal/plants_list_screen.dart';
import 'appColors.dart';
import 'user.dart';
import 'plant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      if (_emailController.text != '' && _passwordController.text != '') {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
        final User? thisUser = userCredential.user;
        final AppUser appUser =
            AppUser(uid: thisUser!.uid, email: thisUser.email);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DashboardScreen(user: appUser),
        //   ),
        // );
        Navigator.pushReplacementNamed(context, '/plants_list');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                  icon: const Icon(Icons.arrow_back, size: 28),
                  padding: EdgeInsets.zero,
                ),
                const SizedBox(height: 30),
                Text(
                  'Welcome back 👋',
                  style: GoogleFonts.urbanist(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                  ).copyWith(
                    color: AppColors.kGreyScale900,
                  ),
                ),
                Text(
                  'Please enter your email & password to sign in.',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
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
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (checked) {},
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Remember me',
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ).copyWith(
                        color: AppColors.kGreyScale900,
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
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimary,
                        minimumSize: const Size(180, 58),
                        foregroundColor: AppColors.kWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(color: AppColors.kGreyScale200),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, '/password_reset');
                    },
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                      ).copyWith(
                        color: AppColors.kPrimary,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ).copyWith(
                        color: AppColors.kGreyScale900,
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign up',
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
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
