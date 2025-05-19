import 'package:flutter/material.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/core/components/appButton.dart';
import 'package:lapanganku/data/model/task_model/task_model.dart';

class AnswerScreen extends StatefulWidget {
  AnswerScreen({super.key, required this.task});

  final TaskModel task;
  final TextEditingController answerController = TextEditingController();

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
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
                          widget.task.judul  ?? '',
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
                        Appbutton(
                          label: 'send',
                          color: Appcolors.basicColor,
                          onPressed: () {

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
    );
  }
}
