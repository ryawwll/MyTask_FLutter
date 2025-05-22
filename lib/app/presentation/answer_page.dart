import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/cubit/get_jawaban_cubit/get_jawaban_cubit.dart';
import 'package:lapanganku/app/cubit/get_jawaban_cubit/get_jawaban_state.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetJawabanCubit()..getJawaban(),
      child: _Content(),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER DENGAN GRADIENT
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Appcolors.basicColor, Appcolors.basic2Color],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Answer Page',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Do your assignment now!',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            BlocBuilder<GetJawabanCubit, GetJawabanState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Appcolors.basicColor,
                    ),
                  );
                }

                if (state.errorMessage != '') {
                  return Center(child: Text(state.errorMessage));
                }

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: RefreshIndicator(
                    onRefresh:
                        () => context.read<GetJawabanCubit>().getJawaban(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.getJawabanResponModel?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              state
                                      .getJawabanResponModel?[index]
                                      .tugas
                                      ?.judul ??
                                  '',
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state
                                          .getJawabanResponModel?[index]
                                          .isiJawaban ??
                                      '',
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 112,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Appcolors.basicColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      state
                                              .getJawabanResponModel?[index]
                                              .nilai
                                              ?.nilai
                                              .toString() ??
                                          'belum di nilai',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    SizedBox(width: 8),
                                    Text(
                                      state
                                              .getJawabanResponModel?[index]
                                              .createdAt ??
                                          '',
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
