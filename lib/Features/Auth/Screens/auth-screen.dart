import 'package:bloggios_mart/Common/Widgets/custom-button.dart';
import 'package:bloggios_mart/Common/Widgets/custom-textField.dart';
import 'package:bloggios_mart/Constants/global-variables.dart';
import 'package:bloggios_mart/Features/Auth/Services/auth-service.dart';
import 'package:flutter/material.dart';

enum AuthEnum { signUp, signIn }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _value = 0;
  //For default radio button
  AuthEnum _auth = AuthEnum.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //Dispose method so that we don't have any memory leaks
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: _auth == AuthEnum.signUp
                    ? GlobalVariables.lightBackgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                leading: Transform.scale(
                  scale: 1.2,
                  child: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: AuthEnum.signUp,
                    groupValue: _auth,

                    //Here AuthEnum comes as if value is changed than AuthEnum also change
                    onChanged: (AuthEnum? value) {
                      setState(() {
                        _auth = value!;
                      });
                    },
                  ),
                ),
              ),

              //SignUp Form
              if (_auth == AuthEnum.signUp)
                Container(
                  color: GlobalVariables.lightBackgroundColor,
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: "SignUp",
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              } else {}
                            })
                      ],
                    ),
                  ),
                ),

              //SignIn Radio
              ListTile(
                tileColor: _auth == AuthEnum.signIn
                    ? GlobalVariables.lightBackgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  "Sign-In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                leading: Transform.scale(
                  scale: 1.2,
                  child: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: AuthEnum.signIn,
                    groupValue: _auth,

                    //Here AuthEnum comes as if value is changed than AuthEnum also change
                    onChanged: (AuthEnum? value) {
                      setState(() {
                        _auth = value!;
                      });
                    },
                  ),
                ),
              ),

              //SignIn Form
              if (_auth == AuthEnum.signIn)
                Container(
                  color: GlobalVariables.lightBackgroundColor,
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: "SignIn",
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              } else {}
                            })
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )),
      ),
    );
  }
}
