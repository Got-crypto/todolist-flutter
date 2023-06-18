import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'TodoList',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: Column(children: [_input(), _input()]),
      )),
    );
  }

  Widget _input() {
    return Container(
        height: 40,
        width: 300,
        margin: const EdgeInsets.only(top: 50, left: 50),
        child: Row(
          children: [
            const Expanded(
                child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add your todos here',
                  contentPadding: EdgeInsets.zero,
                  fillColor: Colors.amber),
            )),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Add'))
          ],
        ));
  }
}
