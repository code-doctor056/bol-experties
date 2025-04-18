import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Search bar
              const Text(
                "Vehicle Reports",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search by plate or VIN",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.qr_code_scanner),
                  fillColor: const Color(0xFFF5F6FA),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Active Reports
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Active Reports",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ReportCard(
                      title: "Import\nValuation",
                      status: "In Review",
                      statusColor: Colors.orange,
                      date: "2 days ago",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ReportCard(
                      title: "Damage\nReport",
                      status: "Ready",
                      statusColor: Colors.green,
                      date: "Today",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              /// AI-recommended slots
              const Text(
                "AI-recommended time slots",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(
                    child: SlotCard(
                      name: "Wednesday",
                      time: "10:00–12:00",
                      city: "Amsterdam",
                      matchLabel: "Optimal Match",
                      matchColor: Colors.green,
                      avatarUrl: "https://randomuser.me/api/portraits/men/11.jpg",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: SlotCard(
                      name: "Thursday 1",
                      time: "16:00",
                      city: "Rotterdam",
                      matchLabel: "Good Match",
                      matchColor: Colors.lightGreen,
                      avatarUrl: "https://randomuser.me/api/portraits/men/12.jpg",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Start New Report Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Start New Report"),
                ),
              ),
            ],
          ),
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Appointments"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final String date;

  const ReportCard({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor, fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          Text(date, style: const TextStyle(fontSize: 12, color: Colors.black54))
        ],
      ),
    );
  }
}

class SlotCard extends StatelessWidget {
  final String name;
  final String time;
  final String city;
  final String matchLabel;
  final Color matchColor;
  final String avatarUrl;

  const SlotCard({
    super.key,
    required this.name,
    required this.time,
    required this.city,
    required this.matchLabel,
    required this.matchColor,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 18,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(time, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(city, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: matchColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              matchLabel,
              style: TextStyle(color: matchColor, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
