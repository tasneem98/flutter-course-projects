import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onPressedCallBack;

  const AddTaskScreen({super.key, required this.onPressedCallBack});

  @override
  Widget build(BuildContext context) {
    String newTaskName = '';

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding:
              const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New Task',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurpleAccent,
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                onChanged: (val) {
                  newTaskName = val;
                },
                autofocus: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => onPressedCallBack(newTaskName),
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.deepPurpleAccent),
                  shape:
                      WidgetStateProperty.all(const RoundedRectangleBorder()),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
