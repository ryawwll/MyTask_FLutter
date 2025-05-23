import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/core/components/appButton.dart';
import 'package:lapanganku/app/cubit/auth_cubit/auth_cubit.dart';
import 'package:lapanganku/app/cubit/auth_cubit/auth_state.dart';
import 'package:lapanganku/app/presentation/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  final TextEditingController nameControlller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void dispose() {
    nameControlller.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen:
          (previous, current) =>
              previous.registerResponModel != current.registerResponModel ||
              current.errorMessage != previous.errorMessage,
      listener: (context, state) {
        if (state.registerResponModel.accessToken != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }

        if (state.errorMessage != "") {
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
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
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
                              'Nama',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: nameControlller,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                prefixIcon: Icon(Icons.person),
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
                            SizedBox(height: 15),
                            Text(
                              'Confirm Password',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: confirmPasswordController,
                              keyboardType: TextInputType.text,
                              obscureText: !confirmPasswordVisible,
                              decoration: InputDecoration(
                                hintText: 'Confirm your password',
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      confirmPasswordVisible =
                                          !confirmPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    confirmPasswordVisible
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
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                if (state.isLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: Appcolors.basicColor,
                                    ),
                                  );
                                }
                                return AppButton(
                                  label: 'Register',
                                  buttonColor: Appcolors.basicColor,
                                  onPressed: () {
                                    context.read<AuthCubit>().doRegister(
                                      name: nameControlller.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      password_confirmation:
                                          confirmPasswordController.text,
                                    );
                                  },
                                  height: 45,
                                  width: double.infinity,
                                );
                              },
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
