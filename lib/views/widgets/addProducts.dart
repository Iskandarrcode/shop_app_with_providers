import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/models/product.dart';
import 'package:provider/provider.dart';

class AddProductAlertDialog extends StatefulWidget {
  const AddProductAlertDialog({super.key});

  @override
  State<AddProductAlertDialog> createState() => _AddProductAlertDialogState();
}

class _AddProductAlertDialogState extends State<AddProductAlertDialog> {
  final TextEditingController courseTitle = TextEditingController();
  final TextEditingController coursePrice = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: const Color.fromARGB(173, 20, 31, 83),
        title: const Text("Add Products"),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: courseTitle,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Course Title",
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: coursePrice,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Course Price",
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Price";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              "Bekor qilish",
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (courseTitle.text.isNotEmpty && coursePrice.text.isNotEmpty) {
                Navigator.pop(context, true);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text("Qo'shish"),
          )
        ],
      ),
    );
  }
}
