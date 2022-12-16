import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const AppointmentDragDrop());

class AppointmentDragDrop extends StatefulWidget {
  const AppointmentDragDrop({Key? key}) : super(key: key);

  @override
  AppointmentDragDropState createState() => AppointmentDragDropState();
}

class AppointmentDragDropState extends State<AppointmentDragDrop> {
  late _DataSource _events;

  @override
  void initState() {
    _events = _addAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SfCalendar(
                  allowedViews: const [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.workWeek,
                    CalendarView.timelineDay,
                    CalendarView.timelineWeek,
                    CalendarView.timelineWorkWeek,
                    CalendarView.schedule,
                  ],
                  dataSource: _events,
                  allowDragAndDrop: true,
                  onDragEnd: _dragEnd,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _dragEnd(AppointmentDragEndDetails appointmentDragEndDetails) {
    Appointment detail = appointmentDragEndDetails.appointment as Appointment;
    Duration duration = detail.endTime.difference(detail.startTime);

    DateTime start = DateTime(
        appointmentDragEndDetails.droppingTime!.year,
        appointmentDragEndDetails.droppingTime!.month,
        appointmentDragEndDetails.droppingTime!.day,
        appointmentDragEndDetails.droppingTime!.hour,
        0,
        0);

    final List<Appointment> appointment = <Appointment>[];
    _events.appointments!.remove(appointmentDragEndDetails.appointment);

    /// No direct support for drop the appointment to specified time intervals. So remove the dragged appointment add
    /// new appointment with specified timing for dropping.
    _events.notifyListeners(CalendarDataSourceAction.remove,
        <dynamic>[appointmentDragEndDetails.appointment]);

    Appointment app = Appointment(
      subject: detail.subject,
      color: detail.color,
      startTime: start,
      endTime: start.add(duration),
    );

    appointment.add(app);

    _events.appointments!.add(appointment[0]);

    _events.notifyListeners(CalendarDataSourceAction.add, appointment);
  }

  _DataSource _addAppointments() {
    List<Appointment> _appointmentCollection = <Appointment>[];

    final DateTime today = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour);
    _appointmentCollection.add(Appointment(
        startTime: today,
        endTime: today.add(const Duration(hours: 1)),
        subject: 'Planning',
        color: Colors.green));
    _appointmentCollection.add(Appointment(
        startTime: today.add(const Duration(days: -1, hours: 2)),
        endTime: today.add(const Duration(days: -1, hours: 3)),
        subject: 'Meeting',
        color: Colors.red));
    _appointmentCollection.add(Appointment(
        startTime: today.add(const Duration(days: -2, hours: 5)),
        endTime: today.add(const Duration(days: -2, hours: 6)),
        subject: 'Retrospective',
        color: Colors.pink));
    _appointmentCollection.add(Appointment(
        startTime: today.add(const Duration(days: 2, hours: 5)),
        endTime: today.add(const Duration(days: 2, hours: 6)),
        subject: 'Birthday',
        color: Colors.pink));
    _appointmentCollection.add(Appointment(
        startTime: today.add(const Duration(days: 3, hours: 3)),
        endTime: today.add(const Duration(days: 3, hours: 4)),
        subject: 'Consulting',
        color: Colors.deepPurple));
    return _DataSource(_appointmentCollection);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}