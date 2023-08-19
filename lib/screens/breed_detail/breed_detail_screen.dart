import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_app/models/breed.dart';
import 'package:cat_app/screens/widgets/start_description.dart';
import 'package:flutter/material.dart';

class BreedDetailScreen extends StatelessWidget {
  final Breed breed;
  const BreedDetailScreen({
    super.key,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(breed.name),
        ),
        body: Column(
          children: [
            _buildBreedImage(context),
            _buildBreedDescription(),
          ],
        ));
  }

  Widget _buildBreedImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: breed.image?.url ?? '',
        fit: BoxFit.fill,
        height: 370,
        width: double.infinity,
        errorWidget: (context, _, __) => Image.asset(
          'assets/images/place_holder.png',
          height: 370,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildBreedDescription() {
    return Expanded(
        child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              breed.description,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ColumnDescription(
                  label: 'Origin:',
                  value: breed.origin,
                ),
                ColumnDescription(
                  label: 'Weight:',
                  value: '${breed.weight.metric} kg',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ColumnDescription(
                  label: 'Life span:',
                  value: '${breed.lifeSpan} years',
                ),
                ColumnDescription(
                  label: 'Intelligence:',
                  value: '${breed.intelligence} / 5',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StarsDescription(
                  label: 'Adaptability:',
                  stars: breed.adaptability,
                ),
                StarsDescription(
                  label: 'Affection level:',
                  stars: breed.affectionLevel,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StarsDescription(
                  label: 'Child friendly:',
                  stars: breed.childFriendly,
                ),
                StarsDescription(
                  label: 'Dog friendly:',
                  stars: breed.dogFriendly,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StarsDescription(
                  label: 'Energy level:',
                  stars: breed.energyLevel,
                ),
                StarsDescription(
                  label: 'Shedding Level:',
                  stars: breed.sheddingLevel,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StarsDescription(
                  label: 'Grooming:',
                  stars: breed.grooming,
                ),
                StarsDescription(
                  label: 'Bidability:',
                  stars: breed.bidability ?? 0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StarsDescription(
                  label: 'Health issues:',
                  stars: breed.healthIssues,
                ),
                StarsDescription(
                  label: 'Hypoallergenic:',
                  stars: breed.hypoallergenic,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StarsDescription(
                  label: 'Stranger Fliendly:',
                  stars: breed.strangerFriendly,
                ),
                StarsDescription(
                  label: 'Vocalisation:',
                  stars: breed.vocalisation,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StarsDescription(
                  label: 'Intelligence:',
                  stars: breed.intelligence,
                ),
                StarsDescription(
                  label: 'Social needs:',
                  stars: breed.socialNeeds,
                ),
              ],
            ),
            ColumnDescription(
              label: 'Temperament:',
              value: breed.temperament,
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    ));
  }
}

class ColumnDescription extends StatelessWidget {
  final String label;
  final String value;

  const ColumnDescription({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
