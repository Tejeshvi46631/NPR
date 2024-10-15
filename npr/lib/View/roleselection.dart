import 'package:flutter/material.dart';
import 'package:npr/View/loginScreen.dart';
import 'package:npr/View/widget/appbar.dart';

class AppBarColor {
  static Color appBarColor = const Color.fromARGB(255, 125, 197, 197);
}

class RoleSelection extends StatefulWidget {
  const RoleSelection({Key? key}) : super(key: key);

  @override
  _RoleSelectionState createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Role Selection',
        showBackArrow: true,
        // Using the custom appbar color
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Add an image or graphic banner (Optional)
              Text(
                'Select Your Role',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:AppBarColor.appBarColor,
                ),
              ),
              const SizedBox(height: 20),
              _buildRoleOption(
                title: 'HLO',
                icon: Icons.security_rounded,
                value: 'HLO',
              ),
              _buildRoleOption(
                title: 'NPR',
                icon: Icons.people_rounded,
                value: 'NPR',
              ),
              _buildRoleOption(
                title: 'PE',
                icon: Icons.school_rounded,
                value: 'PE',
              ),
              const SizedBox(height: 40),
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build role options with icons
  Widget _buildRoleOption(
      {required String title, required IconData icon, required String value}) {
    return RadioListTile<String>(
      title: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      value: value,
      groupValue: _selectedRole,
      activeColor: Color.fromARGB(255, 52, 173, 206),
      onChanged: (String? value) {
        setState(() {
          _selectedRole = value;
        });
      },
    );
  }

  // Button to confirm role selection
  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_selectedRole != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Selected Role: $_selectedRole')),
            );
            login();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select a role')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Color.fromARGB(255, 52, 188, 230), // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Confirm',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyLogin()),
    );
  }
}
