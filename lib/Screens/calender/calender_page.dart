import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Screens/BottomNavBar/bottom_nav.dart';
import '../../Screens/Drawer/navigation_drawer.dart';
import '../../Styles/Color/appTheme.dart';
import 'event.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  void _addEvent(DateTime date, Event event) {
    if (events[date] != null) {
      events[date]!.add(event);
    } else {
      events[date] = [event];
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  NavigationDrawerClass(),
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Calender",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColorDark,
      ),
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedDay != null) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColors.backgroundColorDark,
                    scrollable: true,
                    content: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.backgroundColor),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Add Event",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            controller: _eventController,
                            decoration: const InputDecoration(
                              hintText: "Add Title",
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                            ),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _addEvent(
                                  _selectedDay!, Event(_eventController.text));
                              _eventController.clear();
                              Navigator.of(context).pop();
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  AppColors.unselectedButtonColor)),
                          child: const Text("Submit",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                    ],
                  );
                });
          }
        },
        hoverElevation: 10,
        hoverColor: AppColors.unselectedButtonColor,
        backgroundColor: AppColors.buttonColor,
        tooltip: 'Add Event',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: AppColors.backgroundColorDark),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar<Event>(
                startingDayOfWeek: StartingDayOfWeek.monday,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                      color: AppColors.backgroundColor, shape: BoxShape.circle),
                  todayTextStyle: TextStyle(color: Colors.black),
                  selectedDecoration: BoxDecoration(
                      color: AppColors.cardColor, shape: BoxShape.circle),
                  selectedTextStyle: TextStyle(color: Colors.black),
                  weekendTextStyle: TextStyle(color: Colors.red),
                ),
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                eventLoader: (day) {
                  return _getEventsForDay(day);
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    if (events.isNotEmpty) {
                      return Positioned(
                        right: 1,
                        bottom: 1,
                        child: _buildEventsMarker(date, events),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: _buildEventList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List<Event> events) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.buttonColor,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: const TextStyle().copyWith(
            color: Colors.black,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildEventList() {
    final eventsForDay = _getEventsForDay(_selectedDay ?? _focusedDay);
    return ListView.builder(
      itemCount: eventsForDay.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: const Border(
                    left: BorderSide(color: AppColors.buttonColor, width: 5)),
                color: Colors.white30),
            child: ListTile(
                textColor: Colors.black,
                title: Text(eventsForDay[index].title),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context){
                    return [
                      PopupMenuItem(child: Text("Edit"),value: "Edit",),
                      PopupMenuItem(child: Text("Delete"),value: "Delete",)
                    ];
                  },
                  color: Colors.white,
                  tooltip: "More",
                )),
          ),
        );
      },
    );
  }
}
