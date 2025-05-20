import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/core/components/appButton.dart';
import 'package:lapanganku/app/cubit/auth_cubit/auth_cubit.dart';
import 'package:lapanganku/app/cubit/auth_cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const _Content(),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  String? errorText = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validatePassword(String value) {
    if (value.length < 8 && value.isNotEmpty) {
      setState(() {
        errorText = 'password minimal 8 karakter';
      });
    } else {
      setState(() {
        errorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen:
          (previous, current) =>
              previous.loginResponModel != current.loginResponModel ||
              previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.loginResponModel.message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.loginResponModel.message ?? '',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacementNamed(context, '/main');
        }

        if (state.errorMessage != '') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Appcolors.basic2Color, Appcolors.basicColor],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: Colors.transparent),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Vector.png',
                      height: 58,
                      width: 108,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 29,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ), // Radius border
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                                prefixIcon: Icon(Icons.email),
                                filled: true,
                                fillColor: Color(0xffD4D4D4),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Appcolors.basicColor,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: !passwordVisible,
                              onChanged: validatePassword,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffD4D4D4),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Appcolors.basicColor,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            Appbutton(
                              label: 'Login',
                              color: Appcolors.basicColor,
                              onPressed: () async {
                                await context.read<AuthCubit>().doLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              },
                              height: 45,
                              width: double.infinity,
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'don\'t have an account?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/signup');
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff008ADF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
