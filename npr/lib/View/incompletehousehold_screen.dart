import 'package:flutter/material.dart';

class IncompleteHousehold extends StatefulWidget {
  const IncompleteHousehold({super.key});

  @override
  State<IncompleteHousehold> createState() => _IncompleteHouseholdState();
}

class _IncompleteHouseholdState extends State<IncompleteHousehold> {
  int _selectedStatus = 0; // Variable to manage selected radio button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Incomplete Household',
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
            padding: const EdgeInsets.all(3.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Top text section
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Household Members Details',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              // Main section with left details and right images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side container with details
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            'Block No: 0031',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Household No: 0002',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Total Number: 3',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Right side container with images and titles
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Add icon with title
                          Column(
                            children:  [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    'assets/images/follow.gif'), // Replace with actual image reference
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Add',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          // Refresh icon with title
                          Column(
                            children:  [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    'assets/images/refresh.gif'), // Replace with actual image reference
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Refresh',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          // Split icon with title
                          Column(
                            children:  [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    'assets/images/split.gif'), // Replace with actual image reference
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Split',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Horizontal container with text
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(top: 10.0),
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
              // New horizontal container with radio buttons
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top line with name and code
                      const Text(
                        '001 Usha Verma',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left side with code
                          const Text(
                            '001',
                            style: TextStyle(fontSize: 16),
                          ),
                          // Right side with radio buttons
                          Row(
                            children: [
                              // Available option
                              Row(
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _selectedStatus,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _selectedStatus = value!;
                                      });
                                    },
                                  ),
                                  const Text('Available'),
                                ],
                              ),
                              // Moved Out option
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _selectedStatus,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _selectedStatus = value!;
                                      });
                                    },
                                  ),
                                  const Text('Moved Out'),
                                ],
                              ),
                              // Died option
                              Row(
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _selectedStatus,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _selectedStatus = value!;
                                      });
                                    },
                                  ),
                                  const Text('Died'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Scrollable Table with tabular data
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      border: TableBorder.all(color: Colors.grey),
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(4),
                      },
                      children: [
                        _buildTableRow('Census House No as in houselist', '2',
                            Colors.white),
                        _buildTableRow('Name', 'Usha Verma',
                            Color.fromARGB(255, 125, 197, 197)),
                        _buildTableRow(
                            'Relationship', 'Head/self', Colors.white),
                        _buildTableRow('Sex', 'Female',
                            Color.fromARGB(255, 125, 197, 197)),
                        _buildTableRow('Date of Birth (DD-MM-YYYY)',
                            '15-07-1969', Colors.white),
                        _buildTableRow('Birth Country', 'India',
                            Color.fromARGB(255, 125, 197, 197)),
                        _buildTableRow(
                            'Marital Status', 'Widowed', Colors.white),
                        _buildTableRow(
                            'Census Household no.s in Houselist(New)',
                            '',
                            Color.fromARGB(255, 125, 197, 197)),
                        _buildTableRow(
                            'SE Reference Number', 'BRJ00989', Colors.white),
                        _buildTableRow('Birth Place Country', '',
                            Color.fromARGB(255, 125, 197, 197)),
                        _buildTableRow(
                            'Birth Place State', 'Baramati', Colors.white),
                        _buildTableRow('Nationality', 'Indian',
                            Color.fromARGB(255, 125, 197, 197)),
                        _buildTableRow(
                            'If holding Passport, then enter Passport Number',
                            '',
                            Colors.white),
                        _buildTableRow('Education Qualification', 'BE Computer',
                            Color.fromARGB(255, 125, 197, 197)),
                      ],
                    ),
                  ),
                ),
              ),
              // Submit button placed directly below the table
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    // Action when button is tapped
                  
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 125, 197, 197),
                      borderRadius: BorderRadius.circular(30),
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
            ])));
  }

  // Helper method to build table rows with alternating colors
  TableRow _buildTableRow(String label, String value, Color bgColor) {
    return TableRow(
      decoration: BoxDecoration(color: bgColor),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
      ],
    );
  }
}
