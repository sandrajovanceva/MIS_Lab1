import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab/models/exam.dart';

class ExamGrid extends StatefulWidget {
  final List<Exam> exams;
  const ExamGrid({super.key, required this.exams});

  @override
  State<ExamGrid> createState() => _ExamGridState();
}

class _ExamGridState extends State<ExamGrid> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.exams.length,
        itemBuilder: (context, index) {
          final exam = widget.exams[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/details", arguments: exam);
            },
            child: Card(
                color: exam.dateTime.isBefore(DateTime.now())
                    ? Colors.blueGrey.shade100
                    : Colors.blue.shade100,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exam.name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 18, color: Colors.blue.shade700),
                          const SizedBox(width: 6),
                          Text("${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18, color: Colors.green.shade900),
                          const SizedBox(width: 6),
                          Text("${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Icon(Icons.location_on, size: 18, color: Colors.red),
                          const SizedBox(width: 6),
                          Text("Room: ${exam.rooms.join(", ")}"),
                        ],
                      ),

                    ],
                  ),
                )
            ),
          );
        }
    );
  }
}