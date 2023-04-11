import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_provider.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key});

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //provider call
  @override
  Widget build(BuildContext context) {
    TodoProvider provider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Add New Todo")),
      body: Column(children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(label: Text("Title")),
        ),
        TextFormField(
          controller: descController,
          decoration: InputDecoration(label: Text("Description")),
        ),
        ElevatedButton(
            onPressed: () {
              provider.createNewTodo(titleController.text, descController.text);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Todo Added")));
              Navigator.pop(context);
            },
            child: Text("Create Todo"))
      ]),
    );
  }
}
