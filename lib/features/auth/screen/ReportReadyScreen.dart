import 'package:flutter/material.dart';

class ReportReadyScreen extends StatelessWidget {
  const ReportReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle,
                  size: 40, color: Colors.black54),
              const SizedBox(height: 12),
              const Text(
                "Your report is ready!",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                "You can now download or view your report",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),

              /// Download PDF Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Download action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade500,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.download_rounded),
                  label: const Text("Download PDF"),
                ),
              ),
              const SizedBox(height: 12),

              /// View Report Button (outlined)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // View report action
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    side: const BorderSide(color: Colors.black87),
                  ),
                  icon: const Icon(Icons.remove_red_eye),
                  label: const Text("View Report"),
                ),
              ),
              const SizedBox(height: 16),

              /// Share Option
              InkWell(
                onTap: () {
                  // Share logic
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.share, size: 16, color: Colors.black54),
                    SizedBox(width: 6),
                    Text("Share Report",
                        style: TextStyle(color: Colors.black54)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
