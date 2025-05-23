import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/core/components/appButton.dart';
import 'package:lapanganku/app/cubit/answer_cubit/answer_cubit.dart';
import 'package:lapanganku/app/cubit/answer_cubit/answer_state.dart';
import 'package:lapanganku/data/model/task_model/task_model.dart';

class EditAnswerScreen extends StatelessWidget {
  const EditAnswerScreen({super.key, this.task = const TaskModel()});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<AnswerCubit>(),
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
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AnswerCubit, AnswerState>(
      listenWhen:
          (previous, current) =>
              previous.editJawabanResponModel !=
                  current.editJawabanResponModel ||
              current.errorMessage != previous.errorMessage,
      listener: (context, state) {
        if (state.editJawabanResponModel.toString() == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Profile updated successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacementNamed(context, '/main');
        } else if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Edit answer', style: TextStyle(color: Colors.white)),
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
                          BlocBuilder<AnswerCubit, AnswerState>(
                            builder: (context, state) {
                              if (state.isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Appcolors.basicColor,
                                  ),
                                );
                              }
                              return AppButton(
                                label: 'Edit Answer',
                                buttonColor: Appcolors.basicColor,
                                onPressed: () {
                                  context.read<AnswerCubit>().editJawaban(
                                    jawaban: widget.answerController.text,
                                    id: state.editJawabanResponModel.id.toString(),
                                            
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
