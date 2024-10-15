import 'package:flutter/material.dart';
import 'package:npr/View/forgotpasswordScreen.dart';
import 'package:npr/View/widget/appbar.dart';
import 'package:npr/View/widget/otpScreen.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<MyLogin> {
  String? selectedRole;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static Color appBarColor = Color.fromARGB(255, 125, 197, 197);
  List<String> roles = ['PE', 'NPR', 'HLO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Adjust when keyboard appears
      body: Container(
        // Background gradient from white to grey
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white, // White at the top
              Colors.grey.shade300, // Light grey at the bottom
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Banner Image with Gradient
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/populatonbanner.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6), // Darker at the bottom
                        Colors.transparent, // Transparent at the top
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Role',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          DropdownButtonFormField<String>(
                            value: selectedRole,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Select Role',
                            ),
                            items: roles.map((String role) {
                              return DropdownMenuItem<String>(
                                value: role,
                                child: Text(role),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedRole = value;
                              });
                            },
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              hintText: 'Enter Username',
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter Password',
                            ),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity, // Button takes full width
                            child: ElevatedButton(
                              onPressed: () {
                                String role =
                                    selectedRole ?? 'No Role Selected';
                                String username = usernameController.text;
                                String password = passwordController.text;
                                print(
                                    'Role: $role, Username: $username, Password: $password');
                              },
                              child: Text('Login'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    appBarColor, // Match appBar color
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                textStyle: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Footer text at the bottom of the screen
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Center(
                  child: Text(
                    'Developed and Maintained by CDAC Mumbai',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
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




// class MyLogin extends StatefulWidget {
//   const MyLogin({super.key});

//   @override
//   State<MyLogin> createState() => _MyLoginState();
// }

// class _MyLoginState extends State<MyLogin> {
//   String? selectedValue; // For storing the selected dropdown value
//   final List<String> dropdownItems = [
//     'Default',
//     'Red',
//     'Blue',
//     'Orange',
//     'Green',
//     'Amber'
//   ]; // Dropdown items
//   Color backgroundColor = Colors.white; // Default background color

//   void ForgotPassword() {
//     print("OTP Resent");
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
//     );
//   }

//   void login() {
//     print("OTP Resent");
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => OtpEntryScreen()),
//     );
//   }

//   // Function to set background color based on dropdown selection

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Welcome TO NPR-2024', showBackArrow: false),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.white,
//               Colors.grey[200]!,
//             ],
//           ),
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 30), // Add some space from the top

//               // UserID Row with enhanced layout
//               Row(
//                 children: [
//                   const SizedBox(
//                     width: 100,
//                     child: Text(
//                       "UserID",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 6,
//                             spreadRadius: 1,
//                             offset: const Offset(3, 3),
//                           ),
//                         ],
//                       ),
//                       child: const Text(
//                         "31-LAKSHWADEEP",
//                         style: TextStyle(fontSize: 16),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // District Input
//               Row(
//                 children: [
//                   const SizedBox(
//                     width: 100,
//                     child: Text(
//                       "District",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         hintText: '01-LAKSHWADEEP',
//                         contentPadding: const EdgeInsets.all(15),
//                         prefixIcon: const Icon(Icons.location_city),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),

//               Row(
//                 children: [
//                   const SizedBox(
//                     width: 100,
//                     child: Text(
//                       "Password",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         hintText: 'Enter Password',
//                         contentPadding: const EdgeInsets.all(15),
//                         prefixIcon: const Icon(Icons.language),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               GestureDetector(
//                 onTap: ForgotPassword,
//                 child: Text(
//                   "Forgot Password?",
//                   style: TextStyle(fontSize: 16, color: Colors.teal[800]),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               const SizedBox(height: 10),
//               // Login Button with improved styling
//               ElevatedButton(
//                 onPressed: login,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   foregroundColor: Colors.white, // Text color
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text('LOGIN', style: TextStyle(fontSize: 16)),
//               ),
//               const SizedBox(height: 20),

//               // Supervisor Module Button
//               ElevatedButton(
//                 onPressed: login,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange, // Background color
//                   foregroundColor: Colors.white, // Text color
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text('SUPERVISOR MODULE',
//                     style: TextStyle(fontSize: 16)),
//               ),

//               const SizedBox(height: 40), // Space at the bottom

//               // Footer Text with slight transparency
//               const Opacity(
//                 opacity: 0.7,
//                 child: Column(
//                   children: [
//                     Text(
//                       "Design and Developed By",
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//                     ),
//                     Text(
//                       "CDAC-Mumbai (Meity)",
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
