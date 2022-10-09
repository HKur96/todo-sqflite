import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/app_color.dart';
import '../widget/custom_text_button.dart';
import '../widget/custom_text_field.dart';
import '../provider/todo_provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var titleController = TextEditingController(text: '');
  var descController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);
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
                'Add new',
                style: AppColor.whiteTextStyle.copyWith(fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),

            /// TITLE ==================== TITLE  ==============
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

            /// DESCRIPTION ====================== DESCRIPTION ======
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
          title: (todoProvider.isLoading) ? 'Loading...' : 'Create Task',
          onTap: () {
            if (titleController.text.isNotEmpty &&
                descController.text.isNotEmpty) {
              todoProvider.addTodo(
                title: titleController.text,
                desc: descController.text,
              );
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Title can\'t be empty'),
                  duration: Duration(seconds: 1),
                  backgroundColor: AppColor.redColor,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    titleController.text;
    descController.text;
    super.dispose();
  }
}
