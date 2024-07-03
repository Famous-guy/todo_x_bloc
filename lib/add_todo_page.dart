import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';
import 'package:todo_list/models/todo_models.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todo = BlocProvider.of<TudoCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: todoTitleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              todo.addtodo(
                todoTitleController.text,
                context,
              );
              Navigator.pop(context);
              todoTitleController.clear();
            },
            child: const Text('Add'),
          ),
          Expanded(
            child: BlocBuilder<TudoCubit, List<Todo>>(
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
          ),
        ],
      ),
    );
  }
}
