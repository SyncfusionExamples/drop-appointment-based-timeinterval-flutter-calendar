# How to drop the appointment based on the time interval in Flutter Calendar (SfCalendar)?

This example demonstrates How to drop the appointment based on the time interval in Flutter Calendar.

Using the [onDragEnd](https://help.syncfusion.com/flutter/calendar/drag-drop#ondragend) callback of the Flutter Calendar, you can drop the appointments into specific timeslots in the Flutter Event Calendar.

## Defining appointment start time based on the drop information
There is no direct support for dropping the appointment to a specified time interval in the calendar. To find the difference between the appointment's start and end times using the dragEnd callback of the Flutter Calendar. Then, remove the dragged appointment, and based on the appointment drag end information, create a new appointment with a specified time for dropping.

![DropAppointment](https://user-images.githubusercontent.com/46158936/204212908-6a97b78b-a31c-4101-9c2c-cb4d0c9076ee.gif)

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).
