import 'package:flutter/material.dart';
import 'package:npr/View/widget/appbar.dart';

class OtpEntryScreen extends StatelessWidget {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final TextEditingController _otpController5 = TextEditingController();
  final TextEditingController _otpController6 = TextEditingController();

  final String phoneNumber =
      '91########'; // Replace with the actual phone number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Enter OTP', showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the OTP sent message
            Text(
              'Your OTP is sent to $phoneNumber',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Enter the OTP sent to your phone',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOtpTextField(_otpController1),
                _buildOtpTextField(_otpController2),
                _buildOtpTextField(_otpController3),
                _buildOtpTextField(_otpController4),
                _buildOtpTextField(_otpController5),
                _buildOtpTextField(_otpController6),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic to verify OTP
                    _showSuccessDialog(context);
                    String enteredOtp = _otpController1.text +
                        _otpController2.text +
                        _otpController3.text +
                        _otpController4.text +
                        _otpController5.text +
                        _otpController6.text;
                    print('Entered OTP: $enteredOtp');
                    // Add your verification logic here
                  },
                  child: Text('Verify'),
                ),
                SizedBox(width: 10), // Add some space between buttons
                ElevatedButton(
                  onPressed: () {
                    // Logic to resend OTP
                    print('Resend OTP');
                    // Add your resend logic here
                  },
                  child: Text('Resend OTP'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpTextField(TextEditingController controller) {
    return Container(
      width: 40, // Adjusted width for six fields
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1, // Limit to 1 character
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
        ),
      ),
    );
  }
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        title: Row(
          children: [
            Icon(Icons.check_circle,
                color: Colors.green, size: 30), // Success icon
            SizedBox(width: 10), // Space between icon and text
            Text(
              'Success',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Text(
          'Your password has been changed successfully!',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _showDetailsDialog(context); // Close the dialog
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.teal), // Button color
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.teal), // Button color
            ),
          ),
        ],
      );
    },
  );
}

void _showDetailsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFFF0F4F7), // Light background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
        ),
        title: const Text(
          "Are you sure you want to continue with the following details?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent, // Title color
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildDetailRow("State", "Maharashtra"),
            _buildDetailRow("District", "Raigad"),
            _buildDetailRow("Sub-district", "Khalapur"),
            _buildDetailRow("Town", "Khopoli"),
            _buildDetailRow("Ward", "D8"),
            _buildDetailRow("Block", "00B1"),
          ],
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCustomButton(
                  text: "Disagree",
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog on "Disagree"
                  },
                ),
                _buildCustomButton(
                  text: "Agree",
                  color: Colors.greenAccent.shade700,
                  onPressed: () {
                    // Add logic to proceed with action
                    Navigator.of(context).pop(); // Close dialog on "Agree"
                  },
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

// Helper method to create detailed rows in the dialog content
Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      children: [
        Text(
          "$label: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ],
    ),
  );
}

// Helper method to create custom buttons
Widget _buildCustomButton(
    {required String text,
    required Color color,
    required VoidCallback onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Rounded corners for button
      ),
      elevation: 5, // Shadow effect
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
