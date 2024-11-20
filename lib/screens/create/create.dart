import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

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

  // handling vocation selection
  Vocation? selectedVocation;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // submit handler
  void handleSubmit() {
    final name = _nameController.text.trim();
    final slogan = _sloganController.text.trim();

    if (name.isEmpty || slogan.isEmpty || selectedVocation == null) {
      // show error dialog
      // print('name and slogan are required');

      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeadline('You have missing fields.'),
              content: const StyledText(
                  'Please provide a name, slogan, and select a vocation.'),
              actions: [
                StyledButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const StyledHeadline('Close'),
                )
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      return;
    }

    characters.add(Character(
      id: uuid.v4(),
      name: name,
      slogan: slogan,
      vocation: selectedVocation!,
    ));

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
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
        child: SingleChildScrollView(
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

            // select vocation
            const Center(
              child: StyledHeadline('Choose a vocation.'),
            ),
            const Center(
              child: StyledText(
                  'This will determine your character\'s abilities.'),
            ),

            const SizedBox(height: 30),

            VocationCard(
              vocation: Vocation.protector,
              onTap: updateVocation,
              selected: selectedVocation == Vocation.protector,
            ),
            VocationCard(
              onTap: updateVocation,
              vocation: Vocation.ronin,
              selected: selectedVocation == Vocation.ronin,
            ),
            VocationCard(
              onTap: updateVocation,
              vocation: Vocation.medic,
              selected: selectedVocation == Vocation.medic,
            ),
            VocationCard(
              onTap: updateVocation,
              vocation: Vocation.highlander,
              selected: selectedVocation == Vocation.highlander,
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
      ),
    );
  }
}
