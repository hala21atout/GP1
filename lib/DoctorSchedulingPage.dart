import 'package:flutter/material.dart';

class DoctorSchedulingPage extends StatefulWidget {
  const DoctorSchedulingPage({super.key});

  @override
  _DoctorSchedulingPageState createState() => _DoctorSchedulingPageState();
}

class _DoctorSchedulingPageState extends State<DoctorSchedulingPage> {
  String selectedMonth = 'December';
  String selectedDay = 'Mon';

  void _onMonthChanged(String? newValue) {
    setState(() {
      selectedMonth = newValue!;
    });
  }

  void _onDayChanged(String newDay) {
    setState(() {
      selectedDay = newDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doctor's Schedule",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black38,),
        ),
        backgroundColor: const Color(0xFFE8C3BA),
        toolbarHeight: 70,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // التقويم
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4FB),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Text(
                  "Appointment Date",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                DropdownButton<String>(
                  value: selectedMonth,
                  onChanged: _onMonthChanged,
                  items: <String>['December', 'January', 'February', 'March']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedDay,
                  onChanged: (String? newDay) {
                    if (newDay != null) {
                      _onDayChanged(newDay);
                    }
                  },
                  items: <String>[
                    'Sun',
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // الأيام
          Container(
            height: 90,
            color: const Color(0xFFF4F4FB),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                String dayName =
                    ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        dayName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedDay == dayName
                              ? Colors.black
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: selectedDay == dayName
                            ? const Color(0xFFE8C3BA)
                            : Colors.grey[300],
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: selectedDay == dayName
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(thickness: 2),
          // المواعيد
          Expanded(
            child: ListView(
              children: const [
                AppointmentTile(
                  time: "09:00 AM",
                  title: "Patient: John Doe",
                  description: "Skin check-up",
                  location: "Room 101",
                  date: "December 3, 2024",
                  color: Color(0xFF4CAF50),
                ),
                AppointmentTile(
                  time: "10:00 AM",
                  title: "Patient: Mary Smith",
                  description: "Follow-up on medication",
                  location: "Room 102",
                  date: "December 3, 2024",
                  color: Color(0xFFFF9800),
                ),
                NotreservedTile(
                  time: "11:00 AM",
                ),
                AppointmentTile(
                  time: "12:00 AM",
                  title: "Team Meeting",
                  description: "Weekly review",
                  location: "Conference Room",
                  date: "December 3, 2024",
                  color: Color(0xFF9C27B0),
                ),
                NotreservedTile(
                  time: "01:00 PM",
                ),
                AppointmentTile(
                  time: "02:00 PM",
                  title: "Patient: Alex Johnson",
                  description: "Consultation on skin care",
                  location: "Room 103",
                  date: "December 3, 2024",
                  color: Color(0xFFE91E63),
                ),
                AppointmentTile(
                  time: "03:00 PM",
                  title: "Patient: Sarah Lee",
                  description: "Acne treatment follow-up",
                  location: "Room 104",
                  date: "December 3, 2024",
                  color: Color(0xFF00BCD4),
                ),
                NotreservedTile(
                  time: "04:00 PM",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final String time;
  final String title;
  final String description;
  final String location;
  final String date;
  final Color color;
  final bool isReserved;

  const AppointmentTile({
    super.key,
    required this.time,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.color,
    this.isReserved = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: color,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotreservedTile extends StatelessWidget {
  final String time;

  const NotreservedTile({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundColor: Color(0xFFD4EDDA),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "$time - Not reserved",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF155724),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
