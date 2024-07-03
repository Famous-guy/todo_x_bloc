import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';
import 'package:todo_list/models/todo_models.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TudoCubit, List<Todo>>(
        builder: (context, todoes) {
          return ListView(
            children: List.generate(
              todoes.length,
              (index) {
                final todo = todoes[index];
                return ListTile(
                  title: Text(
                    todo.name,
                  ),
                  subtitle: Text(
                    '${todo.createdAt}',
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
