import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        // available points
        Container(
          color: AppColors.secondaryColor,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color:
                    widget.character.points > 0 ? Colors.yellow : Colors.grey,
              ),
              const SizedBox(width: 20),
              const StyledText('Stat points available: '),
              const Expanded(child: SizedBox(width: 20)),
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: StyledHeadline(widget.character.points.toString()),
              ),
            ],
          ),
        ),
        // stats table
        Table(
          children: widget.character.statsAsFormattedList.map((stat) {
            return TableRow(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(.3),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: StyledHeadline(stat.title),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: StyledHeadline(stat.value),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseStat(stat.title);
                        });
                      },
                      icon: Icon(Icons.remove, color: AppColors.textColor),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat.title);
                        });
                      },
                      icon: Icon(Icons.add, color: AppColors.textColor),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ]),
    );
  }
}
