import 'package:finalexamflutter/view/home_page.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add Title Here',
              ),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            Row(
              children: [
                Row(
                  children: [Icon(Icons.calendar_month), Text('20/01/2023')],
                ),
                const Spacer(),
                const Status(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add your content here..'),
                style: TextStyle(
                  fontSize: 15,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                expands: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
