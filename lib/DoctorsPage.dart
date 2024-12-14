import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gp1/home_page.dart';
import 'CustomerCommunity.dart';
import 'CustomerProfile.dart';
import 'CustomerChat.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DoctorsPage> with TickerProviderStateMixin {
  int _selectedIconIndex = -1;
  late AnimationController _controller;
  String _selectedBottomMenu = "";
  bool _isNotificationsVisible = false;

  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Ahmad Alahmad",
      "phone": "0123456789",
      "location": "Amman, Jordan",
      "workingHours": [
        {"time": "8:00 AM", "isBooked": false},
        {"time": "9:00 AM", "isBooked": false},
        {"time": "10:00 AM", "isBooked": false},
        {"time": "11:00 AM", "isBooked": false},
        {"time": "12:00 PM", "isBooked": false},
        {"time": "1:00 PM", "isBooked": false},
        {"time": "2:00 PM", "isBooked": false},
        {"time": "3:00 PM", "isBooked": false},
      ],
    },
    {
      "name": "Dr. Laila Taboq",
      "phone": "0987654321",
      "location": "Irbid, Jordan",
      "workingHours": [
        {"time": "8:00 AM", "isBooked": false},
        {"time": "9:00 AM", "isBooked": false},
        {"time": "10:00 AM", "isBooked": false},
        {"time": "11:00 AM", "isBooked": false},
        {"time": "12:00 PM", "isBooked": false},
      ],
    },
    {
      "name": "Dr. Omar Bitar",
      "phone": "0112233445",
      "location": "Zarqa, Jordan",
      "workingHours": [
        {"time": "8:00 AM", "isBooked": false},
        {"time": "9:00 AM", "isBooked": false},
        {"time": "10:00 AM", "isBooked": false},
        {"time": "11:00 AM", "isBooked": false},
        {"time": "12:00 PM", "isBooked": false},
      ],
    },
    {
      "name": "Dr. Sara Malha",
      "phone": "0223344556",
      "location": "Aqaba, Jordan",
      "workingHours": [
        {"time": "8:00 AM", "isBooked": false},
        {"time": "9:00 AM", "isBooked": false},
        {"time": "10:00 AM", "isBooked": false},
        {"time": "11:00 AM", "isBooked": false},
        {"time": "12:00 PM", "isBooked": false},
      ],
    },
    {
      "name": "Dr. Nawal Malhas",
      "phone": "0223344456",
      "location": "Aqaba, Jordan",
      "workingHours": [
        {"time": "8:00 AM", "isBooked": false},
        {"time": "9:00 AM", "isBooked": false},
        {"time": "10:00 AM", "isBooked": false},
        {"time": "11:00 AM", "isBooked": false},
        {"time": "12:00 PM", "isBooked": false},
      ],
    },
  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleNotifications() {
    setState(() {
      _isNotificationsVisible = !_isNotificationsVisible;
    });
  }

  void _handleIconTap(int iconIndex) {
    setState(() {
      if (iconIndex == 1) {
        _toggleNotifications();
      } else {
        _selectedIconIndex = _selectedIconIndex == iconIndex ? -1 : iconIndex;
      }
    });
  }

  void _bookAppointment(BuildContext context, Map<String, dynamic> doctor) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select a Date",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                  onDateChanged: (selectedDate) {
                    if (selectedDate.weekday == DateTime.friday) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Friday is not available for booking."),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                      _selectTime(context, doctor, selectedDate);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectTime(BuildContext context, Map<String, dynamic> doctor,
      DateTime selectedDate) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            children: [
              Text(
                "Available Times for ${selectedDate.toLocal()}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...doctor["workingHours"].map<Widget>((hour) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      title: Text(
                        hour["time"] ?? "No time available",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: hour["isBooked"] ? Colors.grey : Colors.black,
                        ),
                      ),
                      trailing: hour["isBooked"]
                          ? const Icon(
                              Icons.block,
                              color: Colors.red,
                              size: 30,
                            )
                          : const Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 30,
                            ),
                      onTap: hour["isBooked"]
                          ? null
                          : () {
                              setState(() {
                                hour["isBooked"] = true;
                              });
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Appointment booked at ${hour["time"]} on ${selectedDate.toLocal()}'),
                                ),
                              );
                            },
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFFE8C3BA),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 70.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Doctors', // الكلمة التي تريد عرضها
                style: TextStyle(
                  fontSize: 26, // الحجم
                  fontWeight: FontWeight.bold,
                  color: Colors.black38, // اللون
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.bell,
                size: 30,
                color: _selectedIconIndex == 1 ? Colors.white : Colors.black38,
              ),
              onPressed: () {
                _handleIconTap(1);
              },
              padding: const EdgeInsets.only(top: 20.0),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIconIndex = -1;
          });
        },
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // شريط البحث هنا
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.black38), // أيقونة البحث
                        hintText: 'Search Doctors', // النص الإرشادي
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Colors.black38, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                              color: Color(0xFFE8C3BA), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Colors.black38, width: 1),
                        ),
                      ),
                    ),
                  ),
                  // قائمة الأطباء
                  Expanded(
                    child: ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = doctors[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: ListTile(
                            leading: const Icon(
                              // ignore: deprecated_member_use
                              FontAwesomeIcons.userMd, // أيقونة الطبيب
                              size: 40,
                              color: Colors.black38,
                            ),
                            title: Text(
                              doctor["name"],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Phone: ${doctor["phone"]}"),
                                Text("Location: ${doctor["location"]}"),
                                Text("Specialty: ${doctor["specialty"]}"),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () =>
                                      _bookAppointment(context, doctor),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE8C3BA),
                                  ),
                                  child: const Text("Book"),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomerChat()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE8C3BA),
                                  ),
                                  child: const Text("Chat"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildBottomMenu(),
                ],
              ),
            ),
            if (_isNotificationsVisible)
              Align(
                alignment: Alignment.topRight,
                child: _buildNotificationsPanel(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMenu() {
    return Container(
      color: const Color(0xFFE8C3BA),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomIcon(Icons.home, "Home",
              isSelected: _selectedBottomMenu == "Home"),
          _buildBottomIcon(Icons.people, "Community",
              isSelected: _selectedBottomMenu == "Community"),
          _buildBottomIcon(Icons.camera_alt, "Camera",
              isSelected: _selectedBottomMenu == "Camera"),
          _buildBottomIcon(Icons.chat_bubble, "Chat",
              isSelected: _selectedBottomMenu == "Chat"),
          _buildBottomIcon(Icons.person, "Profile",
              isSelected: _selectedBottomMenu == "Profile"),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, String label,
      {required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBottomMenu = label;
          if (_selectedBottomMenu == "Home") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (_selectedBottomMenu == "Community") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CustomerCommunity()),
            );
          } else if (_selectedBottomMenu == "Chat") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomerChat()),
            );
          } else if (_selectedBottomMenu == "Profile") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomerProfile()),
            );
          }
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : const Color(0xFFE8C3BA),
              borderRadius: BorderRadius.circular(12),
              boxShadow: isSelected
                  ? [
                      const BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      )
                    ]
                  : [],
            ),
            child: Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsPanel() {
    // قائمة ديناميكية للإشعارات
    final List<Map<String, String>> notifications = [
      {
        "type": "like",
        "message": "John liked your post.",
      },
      {
        "type": "comment",
        "message": "Emily commented on your post: 'Nice one!'",
      },
      {
        "type": "chat",
        "message": "You have a new chat from Dr.laila.",
      },
    ];

    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 239, 239), // لون أغمق قليلاً
        border: Border.all(
          color: Colors.black38, // لون الحافة
          width: 1, // سماكة الحافة
        ),
        borderRadius: BorderRadius.circular(8), // زوايا دائرية
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            "Notifications",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
          ),
          const SizedBox(height: 10),
          // عرض الإشعارات الديناميكية
          ...notifications.map((notification) {
            IconData icon;
            switch (notification["type"]) {
              case "like":
                icon = Icons.thumb_up;
                break;
              case "comment":
                icon = Icons.comment;
                break;
              case "reminder":
                icon = Icons.calendar_today;
                break;
              case "chat":
                icon = Icons.mail;
                break;
              default:
                icon = Icons.notification_important;
            }
            return ListTile(
              leading: Icon(icon, color: Colors.black38),
              title: Text(notification["message"] ?? ""),
            );
          })
        ],
      ),
    );
  }
}
