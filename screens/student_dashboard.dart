import 'package:flutter/material.dart';

void main() {
  runApp(StudentDashboard(
    userType: '',
    userDept: '',
    userName: '',
    userPrn: '',
    userNotify: [],
  ));
}

const List<List<String>> sampleData = [
  ['CCRCP05 - Optimization teChniques', 'A', '6.89'],
  ['COPCU70 - Fundamentals of Digital Science ', 'A', '4'],
  ['Physics', 'B', '3'],
  ['Computer Science', 'A', '3'],
  ['English', 'C', '3'],
];

class StudentDashboard extends StatefulWidget {
  final String userType;
  final String userDept;
  final String userName;
  final String userPrn;
  final List<String> userNotify;

  const StudentDashboard({
    Key? key,
    required this.userType,
    required this.userDept,
    required this.userName,
    required this.userPrn,
    required this.userNotify,
  }) : super(key: key);

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  String get userType => widget.userType;
  String get userName => widget.userName;
  String get userPrn => widget.userPrn;
  String get userDept => widget.userDept;
  List<String> get userNotify => widget.userNotify;
  bool showInvigilationInfo = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Student Dashboard ($userType)',
            style: TextStyle(fontSize: 15),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
                Text(
                  userPrn,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Raleway',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Programme',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Raleway',
                  ),
                ),
                Text(
                  userDept,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Semester',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'CGPA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'I',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '6.87',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'You have an upcoming exam on 27-05-2024',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Schedule',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
                 SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    dateButton("25", "SAT", true, () {
                      setState(() {
                        showInvigilationInfo = !showInvigilationInfo;
                      });
                    }),
                    dateButton("26", "SUN", false, () {
                      setState(() {
                        showInvigilationInfo = !showInvigilationInfo;
                      });
                    }),
                    dateButton("27", "MON", true, () {
                      setState(() {
                        showInvigilationInfo = !showInvigilationInfo;
                      });
                    }),
                    dateButton("28", "TUE", false, () {
                      setState(() {
                        showInvigilationInfo = !showInvigilationInfo;
                      });
                    }),
                  ],
                ),
                SizedBox(height: 30),
                if (showInvigilationInfo) ...[
                  const Text(
                    'Seating plan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        'Examination course code',
                        style: TextStyle(fontSize: 14),
                      ),
                     Text(
                        'CC1CRT09',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Room Name',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'F21',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ] else ...[
                  Text(
                    'Alerts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: userNotify.length,
                    itemBuilder: (context, index) {
                      return NotificationButton(
                        icon: Icons.notifications_none,
                        message: userNotify[index],
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Performance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Semester 1 | CGPA 6.87',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataTable(
                    columnSpacing: 20,
                    columns: const <DataColumn>[
                      DataColumn(label: Text('Course')),
                      DataColumn(label: Text('Grade')),
                      DataColumn(label: Text('SCPA')),
                    ],
                    rows: sampleData
                        .map(
                          (datas) => DataRow(
                        cells: [
                          DataCell(
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text(datas[0]),
                            ),
                          ),
                          DataCell(
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text(datas[1]),
                            ),
                          ),
                          DataCell(
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text(datas[2]),
                            ),
                          ),
                        ],
                      ),
                    )
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget dateButton(
    String date, String day, bool isHighlighted, Function() onPressed) {
  return Container(
    padding: isHighlighted ? EdgeInsets.all(4) : null,
    decoration: isHighlighted
        ? BoxDecoration(
            color: Color(0xFFA0E4C3),
            borderRadius: BorderRadius.circular(10),
          )
        : null,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(left: 15, right: 15),
            minimumSize: Size(20, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: isHighlighted ? Color(0xFFA0E4C3) : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            date,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        Text(
          day,
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}
class NotificationButton extends StatelessWidget {
  final IconData icon;
  final String message;

  const NotificationButton({Key? key, required this.icon, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Adjusted MainAxisAlignment
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(width: 5),
        Flexible( // Wrap Text with Flexible widget
          child: Text(
            message,
            style: TextStyle(
              fontSize: 13, // Adjust the font size here
            ),
            overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
          ),
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Reminder'),
                  content: Text(
                    "This is a reminder for $message",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text(
            'See notification',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
