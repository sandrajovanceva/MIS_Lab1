import 'package:flutter/material.dart';
import 'package:mis_lab/models/exam.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final isPast = exam.dateTime.isBefore(now);

    return Scaffold(
      appBar: AppBar(
        title: Text("Детали за испит"),
        backgroundColor: isPast ? Colors.red : Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                exam.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),

            const SizedBox(height: 20),

            _detailTile(
              icon: Icons.calendar_today,
              iconColor: Colors.blue,
              title: "Датум",
              value: "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",
            ),

            const SizedBox(height: 12),

            _detailTile(
              icon: Icons.access_time,
              iconColor: Colors.teal,
              title: "Час",
              value: "${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
            ),

            const SizedBox(height: 12),

            _detailTile(
              icon: Icons.location_on,
              iconColor: Colors.red,
              title: "Просторија",
              value: exam.rooms.join(", "),
            ),

            const SizedBox(height: 30),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: isPast ? Colors.red.shade100 : Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Text(
                  isPast
                      ? "Испитот веќе помина."
                      : "До испитот остануваат: $days дена, $hours часа",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: isPast ? Colors.red.shade800 : Colors.green.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
