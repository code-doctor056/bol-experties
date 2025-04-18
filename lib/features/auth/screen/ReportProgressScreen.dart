import 'package:flutter/material.dart';
import 'package:helllo_world/features/auth/screen/ContactBankDetailsScreen.dart';

class ReportProgressScreen extends StatelessWidget {
  const ReportProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        'title': 'Expert Review',
        'subtitle': 'Completed on Oct 12',
        'status': 'completed',
      },
      {
        'title': 'AI Analysis',
        'subtitle': 'Completed on Oct 12',
        'status': 'completed',
      },
      {
        'title': 'Manager Approval',
        'subtitle': 'In Progress',
        'status': 'in_progress',
      },
      {
        'title': 'Payment Pending',
        'subtitle': 'Upcoming',
        'status': 'upcoming',
      },
      {
        'title': 'Ready to Download',
        'subtitle': 'Upcoming',
        'status': 'upcoming',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Report Progress",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text("Report #RT-2847", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),

            /// Progress List
            ...steps.asMap().entries.map((entry) {
              final index = entry.key;
              final step = entry.value;
              final isLast = index == steps.length - 1;
              Color iconColor;
              IconData iconData;

              switch (step['status']) {
                case 'completed':
                  iconColor = Colors.green;
                  iconData = Icons.check_circle;
                  break;
                case 'in_progress':
                  iconColor = Colors.blue;
                  iconData = Icons.radio_button_checked;
                  break;
                default:
                  iconColor = Colors.grey.shade400;
                  iconData = Icons.radio_button_unchecked;
              }

              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      margin: const EdgeInsets.only(left: 14),
                      height: 70,
                      width: 2,
                      color: isLast ? Colors.transparent : Colors.grey.shade300,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(iconData, color: iconColor),
                    title: Text(
                      step['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      step['subtitle'] as String,
                      style: TextStyle(
                        color:
                            step['status'] == 'in_progress'
                                ? Colors.blue
                                : Colors.grey,
                      ),
                    ),
                  ),
                ],
              );
            }),

            const SizedBox(height: 20),

            /// Estimated Completion Time Box
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.access_time, color: Colors.grey),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Estimated completion time\n2–3 business days',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// Action Buttons
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("View Booking Details"),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactBankDetailsScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.support_agent_outlined),
                label: const Text("Contact Support"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
