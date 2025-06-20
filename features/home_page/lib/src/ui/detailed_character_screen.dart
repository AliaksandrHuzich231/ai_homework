import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'widgets/chip_list.dart';
import 'widgets/info_row.dart';

@RoutePage()
class DetailedCharacterScreen extends StatelessWidget {
  final Character character;

  const DetailedCharacterScreen({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Hero(
                  tag: character.id,
                  child: Image.network(
                    character.imageUrl,
                    height: MediaQuery.sizeOf(context).width / 2,
                    width: MediaQuery.sizeOf(context).width / 2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                character.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.turquoiseWithOpacity,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  character.status,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                LocaleKeys.character_generalInfo.watchTr(context),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            InfoRow(
              label: LocaleKeys.character_species.watchTr(context),
              value: character.species,
            ),
            const SizedBox(height: 4),
            InfoRow(
              label: LocaleKeys.character_gender.watchTr(context),
              value: character.gender,
            ),
            const SizedBox(height: 4),
            InfoRow(
              label: LocaleKeys.character_hair.watchTr(context),
              value: character.hair,
            ),
            const SizedBox(height: 4),
            InfoRow(
              label: LocaleKeys.character_origin.watchTr(context),
              value: character.origin,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                LocaleKeys.character_aliases.watchTr(context),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ChipsList(items: character.alias),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                LocaleKeys.character_abilities.watchTr(context),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ChipsList(items: character.abilities),
          ],
        ),
      ),
    );
  }
}
