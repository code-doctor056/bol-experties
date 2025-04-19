import 'package:flutter/material.dart';
import 'TimeSlotScreen.dart';

class ServiceSelectionScreen extends StatefulWidget {
  const ServiceSelectionScreen({super.key});

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> with SingleTickerProviderStateMixin{
  int _selectedService = 0;

  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  final List<ServiceOption> services = [
    ServiceOption(
      title: "BPM report + tax return",
      subtitle:
      "Get accurate tax estimates for importing vehicles based on current regulations",
      icon: Icons.receipt_long_outlined,
    ),
    ServiceOption(
      title: "Service 2",
      subtitle:
      "Detailed assessment of vehicle damage with repair cost estimates",
      icon: Icons.car_repair_outlined,
    ),
    ServiceOption(
      title: "Service 3",
      subtitle:
      "Current market value analysis based on real-time data",
      icon: Icons.analytics_outlined,
    ),
  ];

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync:this,
      duration:const Duration(milliseconds:800)
    );

    _progressAnimation =Tween <double>(begin:0.0, end:0.25,).animate(
      CurvedAnimation(parent: _animationController, curve:Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Step Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Step 1 of 4", style: TextStyle(fontSize: 12)),
                  Text("25%", style: TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 6),
              AnimatedBuilder(animation: _progressAnimation, builder:(context, child){
                return LinearProgressIndicator(
                  value: _progressAnimation.value,
                  backgroundColor: Colors.grey.shade300,
                  color:Colors.black,
                  minHeight:4,
                );
              }),

              const SizedBox(height: 24),

              /// Title
              const Text(
                "Which service do you need?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Choose the type of report you want to generate",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              /// Options
              ...List.generate(services.length, (index) {
                final service = services[index];
                return GestureDetector(
                  onTap: (){
                    setState((){
                      _selectedService = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom:16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedService == index ? Colors.black : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child:Row(
                      children:[
                        Icon(service.icon, size:28),
                        const SizedBox(width:12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Text(
                                service.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:16,
                                )
                              ),
                              const SizedBox(height:4),
                              Text(service.subtitle,
                              style: const TextStyle(
                                fontSize:13,
                                color:Colors.black54
                              ),)
                            ]
                          )
                        ),
                        Radio<int>(
                          value: index,
                          groupValue: _selectedService,
                          onChanged: (value) {
                            setState((){
                              _selectedService= value!;
                            });
                          },
                          activeColor:Colors.blue,
                        )
                      ]
                    )
                  )
                );
              }),

              const Spacer(),

              /// Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=> const ChooseTimeSlotScreen())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceOption {
  final IconData icon;
  final String title;
  final String subtitle;


  ServiceOption({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}
