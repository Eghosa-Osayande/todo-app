// ignore_for_file: prefer_const_constructors
// prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo/ui/widgets/default_spinners.dart';
import 'package:todo/ui/widgets/disable_widget.dart';
import 'package:todo/utils/debug_print.dart';
import 'package:todo/utils/keyboard.dart';

class TaskForm extends StatefulWidget {
  TaskForm({Key? key, this.onSave, this.description = '', this.title = ''})
      : super(key: key);

  Function? onSave;
  String title;
  String description;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var commonStyle = TextStyle(
      fontFamily: 'hel',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color.fromRGBO(6, 5, 27, 1),
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            children: const [
              Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'hel',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromRGBO(6, 5, 27, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            initialValue: widget.title,
            onChanged: (String v) {
              setState(() {
                widget.title = v;
              });
            },
            
            decoration: InputDecoration(
              hintText: 'What do you want to do?',
              hintStyle: commonStyle.copyWith(
                color: Color.fromRGBO(167, 166, 180, 1),
              ),
              fillColor: Color.fromRGBO(245, 245, 245, 1),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: const [
              Text(
                'Description',
                style: TextStyle(
                  fontFamily: 'hel',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromRGBO(6, 5, 27, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            initialValue: widget.description,
            onChanged: (String v) {
              setState(() {
                widget.description = v;
              });
            },
            maxLines: 4,
            decoration: InputDecoration(
              hintStyle: commonStyle.copyWith(
                color: Color.fromRGBO(167, 166, 180, 1),
              ),
              hintText: 'Describe your task',
              fillColor: Color.fromRGBO(245, 245, 245, 1),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          DisableWidget(
            disable: isLoading,
            child: DisableWidget(
              disable: (widget.title.isEmpty || widget.description.isEmpty),
              opacity: .5,
              child: Material(
                color: Color.fromRGBO(116, 45, 221, 1),
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    KeyboardUtil.hideKeyboard(context);
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await Future.delayed(Duration(seconds: 3));
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: isLoading
                          ? buildDefaultSpinner()
                          : Text(
                              'Save',
                              style: commonStyle.copyWith(
                                  fontSize: 18, color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
