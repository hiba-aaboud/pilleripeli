import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addQuestion.dart';

class AdminMedecinesPage extends StatefulWidget {
  final String categoryID;

  const AdminMedecinesPage({Key? key, required this.categoryID})
      : super(key: key);

  @override
  _AdminMedecinesPageState createState() => _AdminMedecinesPageState();
}

class _AdminMedecinesPageState extends State<AdminMedecinesPage> {
  late CollectionReference medecinesRef;
  late Stream<QuerySnapshot> medecinesStream;

  @override
  void initState() {
    super.initState();
    medecinesRef = FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.categoryID)
        .collection('medecines');
    medecinesStream = medecinesRef.snapshots();
  }

  void onMedecineAdded(String medecineName) async {
    await medecinesRef.add({'name': medecineName});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medecines'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: medecinesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            var medecines = snapshot.data!.docs;

            return ListView.builder(
              itemCount: medecines.length,
              itemBuilder: (context, index) {
                var medecine = medecines[index];
                return ListTile(
                  title: Text(medecine['name']),
                );
              },
            );
          }),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                var categoryId;
                return AddMedecineDialog(categoryId: categoryId);
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddMedecineDialog extends StatefulWidget {
  final String categoryId;
  AddMedecineDialog({required this.categoryId});
  @override
  _AddMedecineDialogState createState() => _AddMedecineDialogState();
}

class _AddMedecineDialogState extends State<AddMedecineDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _medecineNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a new medecine'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _medecineNameController,
          decoration: InputDecoration(
            hintText: 'Enter medecine name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a medecine name';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              String medecineName = _medecineNameController.text;
              FirebaseFirestore.instance
                  .collection('categories')
                  .doc(widget.categoryId)
                  .collection('medecines')
                  .add({'name': medecineName}).then((value) => {
                        Navigator.of(context).pop(),
                      });
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
