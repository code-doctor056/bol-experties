import 'package:flutter/material.dart';
import 'package:helllo_world/features/auth/screen/ReportProgressScreen.dart';
import 'ServiceSelectionScreen.dart';
import 'TimeSlotScreen.dart';
import 'EnterVehicleInfoScreen.dart';
import 'UploadVehiclePhotosScreen.dart';

class MultiStepScreen extends StatefulWidget {
  const MultiStepScreen({super.key});

  @override
  State<MultiStepScreen> createState() => _MultiStepScreenState();
}

class _MultiStepScreenState extends State<MultiStepScreen>
    with SingleTickerProviderStateMixin {
  int currentStep = 0;
  final int totalSteps = 4;

  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: 0.25,
    ).animate(_animationController)..addListener(() => setState(() {}));

    _animationController.forward();
  }

  void _goToNextStep() {
    if (currentStep < totalSteps - 1) {
      setState(() {
        currentStep++;
        _progressAnimation = Tween<double>(
          begin: _progressAnimation.value,
          end: (currentStep + 1) / totalSteps,
        ).animate(_animationController);
        _animationController.forward(from: 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Step ${currentStep + 1} of $totalSteps"),
                      Text("${(_progressAnimation.value * 100).round()}%"),
                    ],
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: _progressAnimation.value,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.black,
                    minHeight: 4,
                  ),
                ],
              ),
            ),

            // swappable content
            Expanded(
              child: IndexedStack(
                index: currentStep,
                children: const [
                  ServiceSelectionScreen(),
                  ChooseTimeSlotScreen(),
                  EnterVehicleInfoScreen(),
                  UploadVehiclePhotosScreen(),
                  // PaymentScreen(),
                ],
              ),
            ),

            // next button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentStep == totalSteps - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReportProgressScreen(),
                        ),
                      );
                    } else {
                      _goToNextStep();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    currentStep == totalSteps - 1 ? "Finish" : "Next",
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
