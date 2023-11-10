import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp3/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title,
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                task.description,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.category.name,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${DateFormat('HH:mm').format(task.date)}  ${DateFormat.yMMMd().format(task.date)}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
