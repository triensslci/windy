import 'package:flutter/material.dart';
import 'package:windy/main.dart';

class SettingsPage extends StatefulWidget {
  final MyHomePageState homePageState;
  final VoidCallback onSettingsChanged;

  SettingsPage({required this.homePageState, required this.onSettingsChanged});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt'),
        foregroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Bật thông báo thời tiết hàng giờ'),
            trailing: Switch(
              value: widget.homePageState.isHourlyNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  widget.homePageState.isHourlyNotificationEnabled = value;
                  widget.onSettingsChanged();
                  widget.homePageState.savePreferences();
                });
              },
              activeColor: const Color.fromARGB(
                  255, 203, 201, 201), // Change the active color
              activeTrackColor: const Color.fromARGB(255, 203, 201, 201)
                  .withOpacity(0.7), // Change the active track color
              inactiveThumbColor:
                  Colors.grey, // Change the inactive thumb color
              inactiveTrackColor: Colors.grey
                  .withOpacity(0.7), // Change the inactive track color
            ),
          ),
          ListTile(
            title: Text('Nhiệt độ'),
            subtitle: DropdownButton<String>(
              value: widget.homePageState.isCelsius ? 'Độ C' : 'Độ F',
              items: <String>['Độ C', 'Độ F']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.homePageState.isCelsius = newValue == 'Độ C';
                  widget.onSettingsChanged();
                  widget.homePageState.savePreferences();
                });
              },
            ),
          ),
          ListTile(
            title: Text('Tốc độ gió'),
            subtitle: DropdownButton<String>(
              value: widget.homePageState.isKilometersPerHour
                  ? 'Kilômét/giờ'
                  : 'Dặm/giờ',
              items: <String>['Kilômét/giờ', 'Dặm/giờ']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.homePageState.isKilometersPerHour =
                      newValue == 'Kilômét/giờ';
                  widget.onSettingsChanged();
                  widget.homePageState.savePreferences();
                });
              },
            ),
          ),
          ListTile(
            title: Text('Áp suất'),
            subtitle: DropdownButton<String>(
              value: widget.homePageState.isMillibars
                  ? 'Milibar'
                  : 'Inch thủy ngân',
              items: <String>['Milibar', 'Inch thủy ngân']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.homePageState.isMillibars = newValue == 'Milibar';
                  widget.onSettingsChanged();
                  widget.homePageState.savePreferences();
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(16),
            child: Text(
              'Được hỗ trợ bởi OpenWeatherMap API',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
