
import 'package:expense_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _signUpInProgress = false;

  @override
  void initState() {
    super.initState();
    FirebaseCrashlytics.instance.log('Into Sign Up Screen');

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
                    'Get Started With Cashio',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Create your secure wallet in just a few steps.',
                    style: Theme.of(context).textTheme.titleMedium,
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
                  TextFormField(
                    obscureText: true,
                    controller: _confirmPasswordTEController,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    validator: (String? value) {
                      if ((value ?? '') != _passwordTEController.text) {
                        return 'Does not match with Password';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      _onTapSignUp();

                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSigUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  Future<void> _onTapSignUp() async {
    FirebaseCrashlytics.instance.log(' Tapped on Sing Up button');
    if (_formkey.currentState!.validate()) {
      //TODO: Create a new user
      try {
        _signUpInProgress = true;
        setState(() {});
        final UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailTEController.text.trim(),
          password: _passwordTEController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New account has been created!')));
        _clearTextFiled();
      } on Exception catch (e) {

        FirebaseCrashlytics.instance.log('Sign Up exception $e');
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
    _confirmPasswordTEController.clear();
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
