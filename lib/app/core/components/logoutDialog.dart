import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/cubit/auth_cubit/auth_cubit.dart';
import 'package:lapanganku/app/cubit/auth_cubit/auth_state.dart';
import 'package:lapanganku/data/datasource/service/local_storage/local_strorage.dart';

class Logoutdialog extends StatelessWidget {
  const Logoutdialog({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AuthCubit(), child: _Content( onConfirm: onConfirm));
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (!state.isLoading) {
          Navigator.of(context).pop();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/signin',
            (route) => false,
          );
          onConfirm();
        }
      },
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.logout, size: 48, color: Appcolors.basicColor),
              const SizedBox(height: 16),
              const Text(
                'Keluar dari akun?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Apakah Anda yakin ingin keluar dari akun ini?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Appcolors.basicColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Batal',
                        style: TextStyle(color: Appcolors.basicColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.basicColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed:
                          state.isLoading
                              ? null
                              : () async {
                                final token = LocalStrorage().getToken();
                                if (token != null && token.isNotEmpty) {
                                  final logoutCubit = context.read<AuthCubit>();
                                  await logoutCubit.doLogout(token);
                                  LocalStrorage().deleteToken();

                                  if (!context.mounted) return;
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/signin',
                                    (route) => false,
                                  );
                                  onConfirm();
                                } else {
                                  if (!context.mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text('Token tidak tersedia.'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                      child:
                          state.isLoading
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                              : const Text(
                                'Keluar',
                                style: TextStyle(color: Colors.white),
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
