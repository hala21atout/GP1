import 'package:flutter/material.dart';
import 'DoctorsHomePage.dart';
import 'DoctorCommunityPage.dart';
import 'DoctorProfilePage.dart';

class DoctorChatPage extends StatefulWidget {
  const DoctorChatPage({super.key});

  @override
  _DoctorChatPageState createState() => _DoctorChatPageState();
}

class _DoctorChatPageState extends State<DoctorChatPage> {
  String _selectedBottomMenu = "Chat";
  String _searchQuery = ""; // قيمة البحث
  final List<Map<String, String>> _chatData = [
    {"name": "Dr. John Doe", "message": "Hello, how can I help?", "time": "2:30 PM"},
    {"name": "Dr. Jane Smith", "message": "Please review the report", "time": "1:15 PM"},
    {"name": "Sarah Johnson", "message": "Hey! Are we still on for today?", "time": "12:00 PM"},
    {"name": "Michael Brown", "message": "Can you share the notes?", "time": "11:45 AM"},
    {"name": "Dr. Emily Clark", "message": "Thank you!", "time": "Yesterday"},
    {"name": "James Lee", "message": "Let’s catch up tomorrow.", "time": "Yesterday"},
    {"name": "Dr. Michael Lee", "message": "Let's schedule a call", "time": "Monday"},
    {"name": "Sophia Martinez", "message": "Looking forward to the meeting.", "time": "Sunday"},
    {"name": "Dr. Sarah Connor", "message": "Follow-up required.", "time": "Sunday"},
    {"name": "Liam Miller", "message": "Got your message. Thanks!", "time": "Last Week"},
    {"name": "Olivia Garcia", "message": "See you soon!", "time": "Last Week"},
  ];

  void _selectBottomMenu(String menuItem) {
    setState(() {
      _selectedBottomMenu = menuItem;
      if (menuItem == "Home") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DoctorsHomePage()),
        );
      }
      if (menuItem == "Community") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DoctorCommunityPage()),
        );
      }
      if (menuItem == "Profile") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DoctorProfilePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredChats = _chatData
        .where((chat) =>
            chat["name"]!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            chat["message"]!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8C3BA),
        elevation: 0,
        title: const Text(
          'Chat',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];
                return _buildChatTile(chat["name"]!, chat["message"]!, chat["time"]!);
              },
            ),
          ),
          _buildBottomMenu(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value; // تحديث قيمة البحث
          });
        },
      ),
    );
  }

  Widget _buildChatTile(String name, String message, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
      child: ListTile(
        tileColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 30,
          child: const Icon(Icons.person, color: Colors.black54, size: 30),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        subtitle: Text(
          message,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Text(
          time,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        onTap: () {
          // وظيفة عند الضغط على الرسالة
        },
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
          _buildBottomIcon(Icons.chat_bubble, "Chat",
              isSelected: _selectedBottomMenu == "Chat"),
          _buildBottomIcon(Icons.person, "Profile",
              isSelected: _selectedBottomMenu == "Profile"),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, String label, {required bool isSelected}) {
    return GestureDetector(
      onTap: () => _selectBottomMenu(label),
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
                          color: Colors.black26, offset: Offset(0, 4), blurRadius: 6)
                    ]
                  : [],
            ),
            child: Icon(icon,
                size: 30,
                color: isSelected ? const Color(0xFFE8C3BA) : Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFFE8C3BA) : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
