import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView(
        children: List.generate(
          50,
          (value) {
            final person = faker.person;
            return InkWell(
              onLongPress: () async {
                await Clipboard.setData(ClipboardData(text: person.name()));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Імя скопійовано'),
                    action: SnackBarAction(
                      label: 'Закрити',
                      onPressed: ScaffoldMessenger.of(context).clearSnackBars,
                    ),
                  ),
                );
              },
              child: ListTile(
                title: Text(person.name()),
                subtitle: Text(person.lastName()),
                trailing: const Icon(Icons.person),
                leading: const Icon(Icons.copy),
              ),
            );
          },
        ),
      ),
    );
  }
}
