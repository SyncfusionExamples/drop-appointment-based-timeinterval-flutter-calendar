# How to drop the appointment based on the time interval in Flutter Calendar (SfCalendar)?

This example demonstrates How to drop the appointment based on the time interval in Flutter Calendar.

Using the [onDragEnd](https://help.syncfusion.com/flutter/calendar/drag-drop#ondragend) callback of the Flutter Calendar, you can drop the appointments into specific timeslots in the Flutter Event Calendar.

## Defining appointment start time based on the drop information

Find the difference between the appointment's start and end times using the dragEnd callback of the Flutter Calendar. Then, based on the appointment drag end information, set the start time for the appointment.

```
void _dragEnd(AppointmentDragEndDetails appointmentDragEndDetails) {
  Appointment detail = appointmentDragEndDetails.appointment as Appointment;
  Duration = detail.endTime.difference(detail.startTime);

  DateTime start = DateTime(
      appointmentDragEndDetails.droppingTime!.year,
      appointmentDragEndDetails.droppingTime!.month,
      appointmentDragEndDetails.droppingTime!.day,
      appointmentDragEndDetails.droppingTime!.hour,
      0,
      0);

  final List<Appointment> appointment = <Appointment>[];
  _events.appointments!.remove(appointmentDragEndDetails.appointment);

  /// No direct support for drop the appointment to specified time intervals. So, remove the dragged appointment add
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

```

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).