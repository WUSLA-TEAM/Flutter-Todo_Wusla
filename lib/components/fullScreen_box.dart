import 'package:flutter/material.dart';
import 'package:wusla/components/moredetails.dart';

class FullScreen extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController controller;

  FullScreen({
    Key? key,
    required this.onCancel,
    required this.onSave,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.error,
          ),
          onPressed: onCancel,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => MoreDetails(
                text: controller.text,
                onCancel: onCancel,
                onSave: onSave,
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .secondary, // Your desired border color
              width: 2.0, // Border thickness
            ),
            borderRadius: BorderRadius.circular(8.0)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontFamily: 'Futura Heavy font',
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  hintText: 'Enter your text',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontFamily: 'Futura Heavy font',
                  ),
                ),
                controller: controller, // Use the provided controller
              ),
            ],
          ),
        ),
      ),
    );
  }
}
