import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addmedecine.dart';

class categoryAdd extends StatefulWidget {
  categoryAdd({Key? key}) : super(key: key);

  @override
  State<categoryAdd> createState() => _categoryAddState();
}

class _categoryAddState extends State<categoryAdd> {
  final CollectionReference categoriesRef =
      FirebaseFirestore.instance.collection('categories');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: categoriesRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          List<Widget> categoryButtons = [];

          snapshot.data!.docs.forEach((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            categoryButtons.add(
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AdminMedecinesPage(categoryID: document.id),
                    ),
                  );
                },
                child: Text(data['name']),
              ),
            );
          });

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: categoryButtons,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AddCategoryDialog(),
                  );
                },
                child: Text('Add Category'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AddCategoryDialog extends StatefulWidget {
  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Category'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _categoryController,
          decoration: InputDecoration(
            hintText: 'Enter category name',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a category name';
            }
            return null;
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('ADD'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              onCategoryAdded();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }

  void onCategoryAdded() {
    Map<String, dynamic> category = {
      'name': _categoryController.text,
    };
    setState(() {
      FirebaseFirestore.instance.collection('categories').add(category);
    });
  }
}
