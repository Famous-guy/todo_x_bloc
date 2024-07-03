import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo_models.dart';

class TudoCubit extends Cubit<List<Todo>> {
  TudoCubit() : super([]);

  void addtodo(String title, BuildContext context) {
    if (title.isEmpty) {
      addError('Title cannot be empty');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Title cannot be empty'),
        ),
      );
      return;
    }
    final todo = Todo(name: title, createdAt: DateTime.now());
    // if (title.isEmpty) {
    //   return;
    // }
    if (kDebugMode) {
      print(
        [
          todo.name,
          todo.createdAt,
        ],
      );
    }
    emit(
      [
        ...state,
        todo,
      ],
    );
    if (kDebugMode) {
      print(
        [
          todo.name,
          todo.createdAt,
        ],
      );
    }
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (kDebugMode) {
      print(e);
    }
    if (kDebugMode) {
      print(stackTrace);
    }
  }
}
