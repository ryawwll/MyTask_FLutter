import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/cubit/Task_cubit/task_cubit.dart';
import 'package:lapanganku/app/cubit/Task_cubit/task_state.dart';
import 'package:lapanganku/app/cubit/cubit/answer_cubit.dart';
import 'package:lapanganku/app/presentation/answer_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit()..getAllTask(),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      'Hello! Fulan',
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

          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: Appcolors.basicColor),
                );
              }

              if (state.error != '') {
                return Center(child: Text(state.error));
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: RefreshIndicator(
                  onRefresh: () => context.read<TaskCubit>().getAllTask(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.taskList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(state.taskList[index].judul ?? ''),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.taskList[index].deskripsi ?? ''),
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
                                    state.taskList[index].ustadz?.name ?? '',
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
                                  Text(state.taskList[index].deadline ?? ''),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                          onTap: () {
                            final task = state.taskList[index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => BlocProvider(
                                      create: (context) => AnswerCubit(),
                                      child: AnswerScreen(task: task),
                                    ),
                              ),
                            );
                          },
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
    );
  }
}
