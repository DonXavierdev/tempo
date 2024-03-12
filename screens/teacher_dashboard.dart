import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Builder(
      builder: (BuildContext context) {
        return TeacherDashboard(
          userType: '',
          userDept: '',
          userName: '',
          userPrn: '',
          userNotify: [''], // Example notifications
        );
      },
    ),
  ));
}

class TeacherDashboard extends StatefulWidget {
  final String userType;
  final String userDept;
  final String userName;
  final String userPrn;
  final List<String> userNotify;

  const TeacherDashboard({
    Key? key,
    required this.userType,
    required this.userDept,
    required this.userName,
    required this.userPrn,
    required this.userNotify,
  }) : super(key: key);

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  bool showInvigilationInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teacher Dashboard',
          style: TextStyle(fontSize: 15),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle account circle button tap
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu button tap
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Text(
                widget.userName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
              Text(
                widget.userPrn,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Raleway',
                ),
              ),
               SizedBox(height: 15),
              const Text(
                'Department',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Raleway',
                ),
              ),
              Text(
                widget.userDept,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Raleway',
                ),
              ),
               SizedBox(height: 15),
              const Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Number of Duties',
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
                      'Friday duties',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      '3',
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
                      '1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 15),
              const Text(
                'You have an upcoming invigilation duty on 27/02/2024',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Raleway',
                ),
              ),
               SizedBox(height: 20),
              SizedBox(height: 20),
              const Text(
                'Schedule',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
               SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  dateButton("25", "SAT", true),
                  dateButton("26", "SUN", false),
                  dateButton("27", "MON", true),
                  dateButton("28", "TUE", false),
                ],
              ),
               
              SizedBox(height: 20),
              if (showInvigilationInfo) ...[
                const Text(
                  'Invigilation Duty Info',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Raleway',
                  ),
                ),
                SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Room Name',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'F21',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'Number of students',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '30',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'Number of invigilators',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '1',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'Number of Courses',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'Courses',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'CC1CRP09 - 15',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'BB3CP05 - 15',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15,)
                    
                  ],
                ),
              ] else ...[
                const Text(
                  'Alerts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
                 SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.userNotify.length,
                  itemBuilder: (context, index) {
                    return NotificationButton(
                      icon: Icons.notifications_none,
                      message: widget.userNotify[index],
                    );
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Previous Duty Info',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Raleway',
                  ),
                ),
                 SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        '14/02/2024 - Monday',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'F01',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        '02/02/2024 - Tuesday',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Auditorium',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget dateButton(String date, String day, bool isHighlighted) {
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
            onPressed: () {
              print('$date pressed');

              setState(() {
                showInvigilationInfo = !showInvigilationInfo;
              });
            },
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
}

class NotificationButton extends StatelessWidget {
  final IconData icon;
  final String message;

  const NotificationButton({
    Key? key,
    required this.icon,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(width: 5),
        Flexible(
          child: Text(
            message,
            style: TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: () {
            showDutyExchangeDialog(context);
          },
          child: const Text(
            'See details',
            style: TextStyle(color: Colors.blue, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

void showDutyExchangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Duty Exchange Request'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                'Don Joe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Request for exchange of duty on 27/02/2024 to 26/02/2024.',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF74D4A6),
                      onPrimary: Colors.white,
                      minimumSize: Size(100, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Accept'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE46D6D),
                      onPrimary: Colors.white,
                      minimumSize: Size(100, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Decline'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
