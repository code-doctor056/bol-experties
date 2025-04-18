import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'EnterVehicleInfoScreen.dart';

class ChooseTimeSlotScreen extends StatefulWidget {
  const ChooseTimeSlotScreen({super.key});

  @override
  State<ChooseTimeSlotScreen> createState() => _ChooseTimeSlotScreenState();
}

class _ChooseTimeSlotScreenState extends State<ChooseTimeSlotScreen> {
  int selectedSuggestedIndex = 0;
  DateTime selectedDate = DateTime.now();
  String selectedTime = '10:00';

  final List<String> times = [
    '09:00',
    '10:00',
    '11:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
  ];

  final List<Map<String, String>> suggestedTimes = [
    {'day': 'Wednesday', 'time': '10:00–12:00', 'note': 'Expert nearby'},
    {'day': 'Thursday', 'time': '14:00–16:00', 'note': 'Recommended by AI'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Step and Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Step 2 of 4", style: TextStyle(fontSize: 12)),
                  Text("50%", style: TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 6),
              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey.shade300,
                color: Colors.black,
                minHeight: 4,
              ),
              const SizedBox(height: 20),
              const Text(
                "Choose a Time Slot",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              /// Suggested Times
              Row(
                children: List.generate(suggestedTimes.length, (index) {
                  final time = suggestedTimes[index];
                  final isSelected = selectedSuggestedIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSuggestedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                isSelected
                                    ? Colors.black
                                    : Colors.grey.shade300,
                          ),
                          color:
                              isSelected
                                  ? Colors.black12.withOpacity(0.04)
                                  : Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  time['day']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              time['time']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black.withOpacity(0.05),
                              ),
                              child: Text(
                                time['note']!,
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// Calendar Section
              Text(
                DateFormat.yMMMM().format(selectedDate),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 320,
                child: Calendar(
                  startOnMonday: false,
                  weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
                  // isExpandable: true,
                  eventsList: null,
                  eventDoneColor: Colors.green,
                  selectedColor: Colors.pink,
                  selectedTodayColor: Colors.red,
                  todayColor: Colors.blue,
                  eventColor: null,
                  locale: 'en_US',
                  todayButtonText: 'Heute',
                  // allDayEventText: 'Ganztägig',
                  // multiDayEndText: 'Ende',
                  isExpanded: true,
                  // expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                  // datePickerType: DatePickerType.date,
                  dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Available Times",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              /// Time slots
              Wrap(
                spacing: 8,
                runSpacing: 12,
                children:
                    times.map((time) {
                      final isSelected = selectedTime == time;
                      return ChoiceChip(
                        label: Text(time),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                        selectedColor: Colors.black,
                        backgroundColor: Colors.grey.shade200,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
              ),
              const Spacer(),

              /// Confirm Appointment Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnterVehicleInfoScreen(),
                      ),
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
                  child: const Text("Confirm Appointment"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
