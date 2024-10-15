import 'package:flutter/material.dart';

class Householdmemberdetails extends StatefulWidget {
  const Householdmemberdetails({super.key});

  @override
  State<Householdmemberdetails> createState() => _HouseholdmemberdetailsState();
}

class _HouseholdmemberdetailsState extends State<Householdmemberdetails> {
  // State variables to track if sections are expanded
  bool isPersonalDetailsExpanded = false;
  bool isEducationExpanded = false;
  bool isPresentAddressExpanded = false;
  bool isPermanentAddressExpanded = false;
  bool areParentsDetailsExpanded = false;
  bool isIdentificationDetailsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Household Members Details',
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Container below AppBar
            Center(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Type of Household - Normal',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // List of Items
            Expanded(
              child: ListView(
                children: [
                  // Personal Details Section with Expand/Collapse feature
                  ListTile(
                    leading: const Icon(
                      Icons.person_outline,
                      color: Color.fromARGB(255, 11, 135, 133),
                    ),
                    title: const Text(
                      'Personal Detail',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isPersonalDetailsExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPersonalDetailsExpanded =
                              !isPersonalDetailsExpanded;
                        });
                      },
                    ),
                  ),
                  if (isPersonalDetailsExpanded)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Name',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Age',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter DOB (dd-mm-yyyy)',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Mobile No',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  const Divider(),

                  // Education/Occupation Section with Expand/Collapse feature
                  ListTile(
                    leading: const Icon(
                      Icons.school,
                      color: Color.fromARGB(255, 11, 135, 133),
                    ),
                    title: const Text(
                      'Education/Occupation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isEducationExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isEducationExpanded = !isEducationExpanded;
                        });
                      },
                    ),
                  ),
                  if (isEducationExpanded)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Education Qualification',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Occupation',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  const Divider(),

                  // Present Address Section with Expand/Collapse feature
                  ListTile(
                    leading: const Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 11, 135, 133),
                    ),
                    title: const Text(
                      'Present Address Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isPresentAddressExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPresentAddressExpanded = !isPresentAddressExpanded;
                        });
                      },
                    ),
                  ),
                  if (isPresentAddressExpanded)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Present Address',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter City',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  const Divider(),

                  // Permanent Address Section with Expand/Collapse feature
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 11, 135, 133),
                    ),
                    title: const Text(
                      'Permanent Address Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isPermanentAddressExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPermanentAddressExpanded =
                              !isPermanentAddressExpanded;
                        });
                      },
                    ),
                  ),
                  if (isPermanentAddressExpanded)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Permanent Address',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter City',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  const Divider(),

                  // Parents Details Section with Expand/Collapse feature
                  ListTile(
                    leading: const Icon(
                      Icons.people,
                      color: Color.fromARGB(255, 11, 135, 133),
                    ),
                    title: const Text(
                      'Parents Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        areParentsDetailsExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          areParentsDetailsExpanded =
                              !areParentsDetailsExpanded;
                        });
                      },
                    ),
                  ),
                  if (areParentsDetailsExpanded)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Father\'s Name',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Mother\'s Name',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  const Divider(),

                  // Identification Details Section with Expand/Collapse feature
                  ListTile(
                    leading: const Icon(
                      Icons.fingerprint,
                      color: Color.fromARGB(255, 11, 135, 133),
                    ),
                    title: const Text(
                      'Identification Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isIdentificationDetailsExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isIdentificationDetailsExpanded =
                              !isIdentificationDetailsExpanded;
                        });
                      },
                    ),
                  ),
                  if (isIdentificationDetailsExpanded)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter ID Type',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter ID Number',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Label color
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 11, 135, 133)), // Hint color
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Add Member Button at Bottom
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  // Action when button is tapped
                 
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 125, 197, 197),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
