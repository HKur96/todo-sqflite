import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_todo.dart';
import '../provider/todo_provider.dart';
import '../config/app_color.dart';
import './edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Text(
              'Task to do',
              style: AppColor.greyTextStyle.copyWith(fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Text(
              'Things to do',
              style: AppColor.blackTextStyle.copyWith(fontSize: 17),
            ),
          ),
          const SizedBox(height: 15),
          FutureBuilder(
            future: todoProvider.getTodo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (todoProvider.itemTodo.isEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 150),
                    Center(
                      child: Text(
                        'You are OK\n There is nothing to do',
                        style: AppColor.blackTextStyle.copyWith(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: todoProvider.itemTodo.length,
                  itemBuilder: (context, index) {
                    final todo = todoProvider.itemTodo[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (context) => TodoProvider(),
                              child: EditPage(
                                id: todo.id,
                                title: todo.title,
                                description: todo.description,
                              ),
                            ),
                          ),
                        ).then((_) {
                          setState(() {});
                        });
                      },
                      child: TodoItem(
                          id: todo.id,
                          title: todoProvider.toUpper(todo.title),
                          description: todoProvider.toUpper(todo.description),
                          onTap: () {
                            setState(() {
                              todoProvider.deleteTodo(todo.id);
                            });
                          }),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.darkBgColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => TodoProvider(),
                child: const AddPage(),
              ),
            ),
          ).then((_) {
            setState(() {});
          });
        },
        child: const Icon(
          Icons.add,
          color: AppColor.lightBgColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TodoItem extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final VoidCallback onTap;
  const TodoItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.lightYellow,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 12,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppColor.blackTextStyle.copyWith(fontSize: 17),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  style: AppColor.greyTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_outline_outlined,
              color: AppColor.redColor,
            ),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
