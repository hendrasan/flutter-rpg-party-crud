import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // submit handler
  void handleSubmit() {
    final name = _nameController.text.trim();
    final slogan = _sloganController.text.trim();

    if (name.isEmpty || slogan.isEmpty) {
      print('name and slogan are required');
      return;
    }

    print('name: $name, slogan: $slogan');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(children: [
          Center(
            child: Icon(
              Icons.person_add,
              color: AppColors.primaryColor,
              size: 36,
            ),
          ),
          const Center(
            child: StyledHeadline('Welcome, new player'),
          ),
          const Center(
            child: StyledText('Create a name and slogan for your character.'),
          ),
          const SizedBox(height: 30),

          // inputs
          TextField(
            controller: _nameController,
            style: GoogleFonts.kanit(
              textStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            cursorColor: AppColors.textColor,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              label: StyledText('Character Name'),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _sloganController,
            style: GoogleFonts.kanit(
              textStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            cursorColor: AppColors.textColor,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.chat_rounded),
              label: StyledText('Character Slogan'),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: StyledButton(
              onPressed: handleSubmit,
              child: const StyledHeadline('Create Character'),
            ),
          )
        ]),
      ),
    );
  }
}
