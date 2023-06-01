import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _KalenderPageState createState() => _KalenderPageState();
}

class _KalenderPageState extends State<CalendarPage> {
  late DateTime _dateTime;
  late String _timezone;

  @override
  void initState() {
    super.initState();
    _dateTime = _selectTimezone('WIB');
    _timezone = 'WIB';
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      _dateTime = _selectTimezone(_timezone);
    });
    Future.delayed(const Duration(seconds: 1), () => _updateTime());
  }

  DateTime _selectTimezone(String timezone) {
    if (timezone == 'WIB') {
      return DateTime.now().toUtc().add(const Duration(hours: 7));
    } else if (timezone == 'WITA') {
      return DateTime.now().toUtc().add(const Duration(hours: 8));
    } else if (timezone == 'WIT') {
      return DateTime.now().toUtc().add(const Duration(hours: 9));
    } else if (timezone == 'London') {
      return DateTime.now().toUtc().add(const Duration(hours: 1)); // London timezone (GMT or UTC+0)
    } else {
      return DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zona Waktu'),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          const SizedBox(height: 30),
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('EEEE, dd MMMM yyyy').format(_dateTime),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          DateFormat('HH:mm:ss').format(_dateTime),
                          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTimezoneButton('WIB'),
                        const SizedBox(width: 16),
                        _buildTimezoneButton('WITA'),
                        const SizedBox(width: 16),
                        _buildTimezoneButton('WIT'),
                        const SizedBox(width: 16),
                        _buildTimezoneButton('London'),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimezoneButton(String timezone) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _timezone = timezone;
        });
      },
      child: Text(timezone),
      style: ElevatedButton.styleFrom(
        primary: _timezone == timezone ? Colors.blueAccent : Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}