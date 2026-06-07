
import 'package:expense_app/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
  TextEditingController();

  void _onTabSignUP() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _signUpInProgress = false;

  @override
  void initState() {
    super.initState();
    FirebaseCrashlytics.instance.log('Into Log In Screen');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 150),
                  Text(
                    'WelCome Back',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordTEController,
                    decoration: InputDecoration(
                      hintText: 'password',
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),

                    validator: (String? value) {
                      if ((value?.length ?? 0) < 5) {
                        return 'Enter your password at least 6 letters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      _onTapLogin();

                    },
                    child: Text('Log In'),
                  ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _onTabSignUP
                    ),
                  ],
                ),
              )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  Future<void> _onTapLogin() async {
    FirebaseCrashlytics.instance.log(' Tapped on Log In button');
    if (_formkey.currentState!.validate()) {
      //TODO: Create a new user
      try {
        _signUpInProgress = true;
        setState(() {});
      FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTEController.text.trim(),
          password: _passwordTEController.text);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()),
                (predicate)=>false
        );
      } on Exception catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        _signUpInProgress = false;
        setState(() {});
      }
    }
  }
  void _clearTextFiled(){
    _emailTEController.clear();
    _passwordTEController.clear();
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
