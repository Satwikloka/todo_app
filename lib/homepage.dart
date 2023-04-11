import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Todo App")),
        body: Consumer(
          builder: (context, TodoProvider provider, child) {
            return ListView.builder(
              itemCount: provider.allTodos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit',
                        arguments: provider.allTodos[index]);
                  },
                  title: Text(
                    provider.allTodos[index].data['title'],
                  ),
                  subtitle: Text(
                    provider.allTodos[index].data['description'],
                  ),
                  leading: Checkbox(
                    value: provider.allTodos[index].data['isDone'] ?? false,
                    onChanged: (value) {
                      provider.markCompleted(provider.allTodos[index].$id,
                          !provider.allTodos[index].data['isDone']);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      provider.deleteTodo(provider.allTodos[index].$id);
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new');
          },
          child: Icon(Icons.add),
        ));
  }
}
