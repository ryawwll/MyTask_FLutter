import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lapanganku/app/core/appColors.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Appcolors.basicColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Answer',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tugas Matematika',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tugas ini membahas konsep pembagian bilangan bulat positif dan negatif. '
                      'Siswa diminta untuk menyelesaikan soal-soal pembagian dengan hasil bilangan bulat, '
                      'serta memahami aturan tanda pada operasi pembagian. '
                      'Kerjakan soal dengan teliti dan sertakan cara pengerjaan.',
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
                          'Wawan S.Pd.I',
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
                        Text('12 Jam'),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit_note_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
