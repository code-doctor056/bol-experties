import 'package:flutter/material.dart';

class UploadVehiclePhotosScreen extends StatelessWidget {
  const UploadVehiclePhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> photoFields = [
      {'label': 'Left Side View', 'added': true},
      {'label': 'Right Side View', 'added': false},
      {'label': 'Front View', 'added': true},
      {'label': 'Back View', 'added': false},
      {'label': 'Interior View', 'added': false},
      {'label': 'Damage Photos (Optional)', 'added': false},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Step Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Step 4 of 4", style: TextStyle(fontSize: 12)),
                  Text("100%", style: TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 6),
              LinearProgressIndicator(
                value: 1.0,
                backgroundColor: Colors.grey.shade300,
                color: Colors.black,
                minHeight: 4,
              ),
              const SizedBox(height: 24),

              /// Title
              const Text(
                "Upload Vehicle Photos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Follow the guide to take the correct pictures",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              /// Photo Boxes
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: photoFields.map((field) {
                    final isAdded = field['added'] as bool;
                    return GestureDetector(
                      onTap: () {
                        // handle image capture
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isAdded ? Icons.check_circle : Icons.camera_alt_outlined,
                              color: isAdded ? Colors.black : Colors.grey,
                              size: 28,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              field['label'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 13),
                            ),
                            if (isAdded)
                              const Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Text(
                                  "Photo added",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle photo submission
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Submit Photos"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
