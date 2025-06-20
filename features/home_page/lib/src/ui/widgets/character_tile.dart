import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  const CharacterTile({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: MediaQuery.sizeOf(context).height / 4,
          decoration: BoxDecoration(
            color: AppColors.turquoiseWithOpacity,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.skyBlue,
                    width: 3,
                  ),
                ),
                child: Hero(
                  tag: character.id,
                  child: CircleAvatar(
                    radius: MediaQuery.sizeOf(context).height / 12,
                    backgroundImage: NetworkImage(character.imageUrl),
                    backgroundColor: AppColors.lightGrey,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${LocaleKeys.character_status.watchTr(context)}: ${character.status}',
                        style: const TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${LocaleKeys.character_species.watchTr(context)}: ${character.species}',
                        maxLines: 2,
                        style: const TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
