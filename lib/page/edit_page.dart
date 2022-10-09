import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/app_color.dart';
import '../widget/custom_text_button.dart';
import '../widget/custom_text_field.dart';
import '../provider/todo_provider.dart';

class EditPage extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  const EditPage({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
  }) : super(key: key);
  static const routeName = '/edit-page';

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var titleController = TextEditingController(text: '');
  var descController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoProvider>(context);
    titleController.text = widget.title;
    descController.text = widget.description;
    return Scaffold(
      backgroundColor: AppColor.darkBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                'Edit task',
                style: AppColor.whiteTextStyle.copyWith(fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),

            /// TITLE ================= TITLE ==================
            ///
            ///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: CustomTextField(
                title: 'Title',
                controller: titleController,
              ),
            ),
            const SizedBox(height: 20),

            /// DESCRIPTION ============= DESCRIPTION ===========
            ///
            ///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: CustomTextField(
                title: 'Description',
                maxLines: 5,
                controller: descController,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        child: CustomTextButton(
          title: 'Edit Task',
          onTap: () {
            todoProvider.editTodo(
              id: widget.id,
              title: titleController.text,
              desc: descController.text,
            );
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppColor.greenColor,
                duration: Duration(seconds: 2),
                content: Text('Edit Succeed'),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    titleController;
    descController;
    super.dispose();
  }
}
