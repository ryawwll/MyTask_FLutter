import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/cubit/cubit/get_jawaban_cubit.dart';
import 'package:lapanganku/app/cubit/cubit/get_jawaban_state.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetJawabanCubit, GetJawabanState>(
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
      body: Column(
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
                CircleAvatar(backgroundColor: Colors.white54, radius: 18),
              ],
            ),
          ),

          SizedBox(height: 20),

          // CARD TUGAS
          // BlocBuilder<GetJawabanCubit, GetJawabanState>(builder: (context, state) {
          //   if (state.isLoading) {
          //     return Center(child: CircularProgressIndicator());
          //   } else if (state.errorMessage != '') {
          //     return Center(child: Text(state.errorMessage));
          //   } else if (state.getJawabanResponModel == null) {
          //     return Center(child: Text('No data available'));
          //   } else {
          //     // Display the data from state.getJawabanResponModel
          //     return Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: RefreshIndicator(
          //         onRefresh: () async {
          //           // Call the getJawaban method to refresh data
          //           await context.read<GetJawabanCubit>().getJawaban(tugasId: '1');
          //         },
          //         child: ListView.builder(
          //           itemCount: state.getJawabanResponModel!.data.length,
          //           itemBuilder: (context, index) {
          //             final jawaban = state.getJawabanResponModel!.data[index];
          //             return Card(
          //               child: ListTile(
          //                 title: Text(jawaban.title),
          //                 subtitle: Text(jawaban.description),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     );
          //   }
          // })
        ],
      ),
    );
  }
}
