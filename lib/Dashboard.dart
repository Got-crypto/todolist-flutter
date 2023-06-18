import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  final TextEditingController _controller = TextEditingController();
  List<String> todos = [];

  void _addTodo() {
    String todo = _controller.text;
    if (todo.isNotEmpty) {
      setState(() {
        todos.add(todo);
      });
    }
    _controller.clear();
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  void _dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        child: Column(children: [_input(), Expanded(child: _todos())]),
      )),
    );
  }

  Widget _input() {
    return Container(
        height: 100,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12))),
        width: 500,
        child: FractionallySizedBox(
          widthFactor: .8,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add your todos here',
                      contentPadding: EdgeInsets.zero,
                      fillColor: Colors.amber),
                )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(onPressed: _addTodo, child: const Text('Add'))
              ],
            ),
          ),
        ));
  }

  Widget _todos() {
    return Container(
        width: 500,
        margin: const EdgeInsets.only(top: 10),
        child: Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: .8,
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final reversedIndex = todos.length - 1 - index;

                  return ListTile(
                    title: Text("${index + 1}. ${todos[reversedIndex]}"),
                    trailing: IconButton(
                        onPressed: () {
                          _deleteTodo(reversedIndex);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                },
              ),
            )));
  }
}
