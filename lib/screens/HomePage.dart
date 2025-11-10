import 'package:flutter/material.dart';
import 'package:mis_lab/models/exam.dart';
import '../widgets/ExamGrid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Exam> _exams;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExamList(n: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: ExamGrid(exams: _exams),
          ),

          Positioned(
            right: 16,
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.indigo.shade700,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.school,
                      color: Colors.white, size: 22),
                  const SizedBox(width: 6),
                  Text(
                    "Вкупно испити: ${_exams.length}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loadExamList({required int n}) async {
    final examList = Exam.exams.take(n).toList();
    examList.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    setState(() {
      _exams = examList;
      _isLoading = false;
    });
  }
}
