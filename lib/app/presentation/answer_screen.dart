import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/core/components/appButton.dart';
import 'package:lapanganku/app/cubit/answer_cubit/answer_cubit.dart';
import 'package:lapanganku/app/cubit/answer_cubit/answer_state.dart';
import 'package:lapanganku/app/presentation/answer_page.dart';
import 'package:lapanganku/data/model/task_model/task_model.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnswerCubit(),
      child: _Content(
        task: task.copyWith(
          id: task.id,
          judul: task.judul,
          deskripsi: task.deskripsi,
          createdAt: task.createdAt,
          updatedAt: task.updatedAt,
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  _Content({required this.task});

  final TaskModel task;
  final TextEditingController answerController = TextEditingController();

  @override
  State<_Content> createState() => _AnswerScreenState();

  void dispose() {
    answerController.dispose();
  }
}

class _AnswerScreenState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AnswerCubit, AnswerState>(
      listenWhen:
          (previous, current) =>
              previous.answerResponModel != current.answerResponModel ||
              previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.answerResponModel != '') {
          // Handle successful response
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Answer submitted successfully!',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state.errorMessage != '') {
          // Handle error response
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AnswerPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Answer Page', style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Appcolors.basicColor, Appcolors.basic2Color],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.task.judul ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            widget.task.deskripsi ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: widget.answerController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Answer...',
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
                          SizedBox(height: 20),
                          AppButton(
                            label: 'send',
                            buttonColor: Appcolors.basicColor,
                            onPressed: () async {
                              if (widget.answerController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'your answer is empty',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }
                              await context.read<AnswerCubit>().submitAnswer(
                                tugas: widget.task.toString(),
                                jawaban: widget.answerController.text,
                              );
                            },
                            height: 45,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
