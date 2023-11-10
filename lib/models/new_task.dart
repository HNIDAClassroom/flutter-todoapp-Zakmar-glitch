import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Personal';
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _submitTaskData() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final category = _selectedCategory;
    final date = _dateController.text.trim();

    if (title.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    // Utilisez les valeurs de title, description, category et date comme vous le souhaitez.

    // Réinitialiser les champs de saisie après la soumission
    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'title',
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 100,
            decoration: const InputDecoration(
              labelText: 'description',
            ),
          ),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            onChanged: (newValue) {
              setState(() {
                _selectedCategory = newValue!;
              });
            },
            items: <String>['Personal', 'Work', 'Shopping']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'category',
            ),
          ),
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'date',
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: _submitTaskData,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
