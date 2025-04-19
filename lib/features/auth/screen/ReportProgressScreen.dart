import 'package:flutter/material.dart';
import 'package:helllo_world/features/auth/screen/ContactBankDetailsScreen.dart';
import 'package:timelines_plus/timelines_plus.dart';

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

            /// TIMELINE START
            FixedTimeline.tileBuilder(
              theme: TimelineThemeData(
                nodePosition: 0,
                indicatorPosition: 0.2,
                color: Colors.grey,
                indicatorTheme: const IndicatorThemeData(size: 20),
                connectorTheme: const ConnectorThemeData(thickness: 2.0),
              ),

              builder: TimelineTileBuilder.connected(
                itemCount: steps.length,
                connectorBuilder:
                    (_, index, ___) =>
                        SolidLineConnector(color: Colors.grey.shade300),
                indicatorBuilder: (context, index) {
                  final status = steps[index]['status'];
                  Color color;
                  IconData icon;
                  switch (status) {
                    case 'completed':
                      color = Colors.green;
                      icon = Icons.check;
                      break;
                    case 'in_progress':
                      color = Colors.blue;
                      icon = Icons.autorenew;
                      break;
                    default:
                      color = Colors.grey;
                      icon = Icons.radio_button_unchecked;
                  }
                  return DotIndicator(
                    color: color,
                    child: Icon(icon, size: 12, color: Colors.white),
                  );
                },
                contentsBuilder: (_, index) {
                  final step = steps[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step['subtitle']!,
                          style: TextStyle(
                            color:
                                step['status'] == 'in_progress'
                                    ? Colors.blue
                                    : Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// TIMELINE END
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
