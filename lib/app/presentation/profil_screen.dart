import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/core/components/logoutDialog.dart';
import 'package:lapanganku/app/cubit/profile_cubit/profile_cubit.dart';
import 'package:lapanganku/app/cubit/profile_cubit/profile_state.dart';
import 'package:lapanganku/data/model/edit_profile_respon_model/edit_profile_respon_model.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return _Content();
      },
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Appcolors.basicColor, Appcolors.basic2Color],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Fulan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Fulan@example.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                '/editprofile',
                              );
                            },
                            icon: Icon(Icons.edit, size: 35),
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (_) => Logoutdialog(
                                    onConfirm: () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/signin',
                                      );
                                    },
                                  ),
                            );
                          },
                          icon: Icon(Icons.logout_outlined, size: 35),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (_) => Logoutdialog(
                                    onConfirm: () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/signin',
                                      );
                                    },
                                  ),
                            );
                          },
                          child: Text(
                            'Log out',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
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
    );
  }
}
