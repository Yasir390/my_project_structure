import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class GetContactTestScreen extends StatefulWidget {
  const GetContactTestScreen({super.key});

  @override
  State<GetContactTestScreen> createState() => _GetContactTestScreenState();
}

class _GetContactTestScreenState extends State<GetContactTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Contact Test Screen'),
        ),
        body: SizedBox(
          height: double.infinity,
          child: FutureBuilder(
            future: getContacts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: Text("No Data"));
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Contact contact = snapshot.data[index];
                  return ListTile(
                    title: Text(contact.displayName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact.phones.isNotEmpty
                              ? contact.phones.first.number
                              : "No phone number", // Avoids RangeError
                        ),
                        Text(
                          contact.emails.isNotEmpty
                              ? contact.emails.first.address
                              : "No email", // Avoids RangeError
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ));
  }

  Future<List<Contact>> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      return await FastContacts.getAllContacts();
    } else {
      return [];
    }
  }
}
