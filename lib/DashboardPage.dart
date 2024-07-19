import 'package:flutter/material.dart';
import 'IdentifyMed/IdentifyMedicationPage.dart';
import 'MedicationPlanner/MedDashboard.dart';
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildDashboardIcon(context, Icons.medical_services, 'Identify Medication', IdentifyMedicationPage()),
          _buildDashboardIcon(context, Icons.calendar_today, 'Medication Planner', DashboardWidget()),
          _buildDashboardIcon(context, Icons.phone_in_talk, 'Emergency Assistance', null),
        ],
      ),
    );
  }

  Widget _buildDashboardIcon(BuildContext context, IconData icon, String label, Widget? page) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: page != null
            ? () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => page),
          );
        }
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50.0),
            SizedBox(height: 10.0),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
