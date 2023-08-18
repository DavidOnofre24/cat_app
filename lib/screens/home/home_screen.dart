import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_app/models/breed.dart';
import 'package:cat_app/screens/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getBreeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildBreedList(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      centerTitle: true,
      title: const Text('CatBreeds'),
      bottom: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextField(
            onChanged: (value) {
              context.read<HomeCubit>().searchBreeds(value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Search for a breed',
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBreedList() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      builder: (context, state) {
        if (state is HomeLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is HomeLoaded) {
          if (state.breeds.isEmpty) {
            return const SliverToBoxAdapter(
                child: Center(
              child: Text('No breeds found'),
            ));
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return BreedCard(breed: state.breeds[index]);
              },
              childCount: state.breeds.length,
            ),
          );
        }
        if (state is HomeError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.message),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildFooter() {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 40,
      ),
    );
  }
}

class BreedCard extends StatelessWidget {
  final Breed breed;

  const BreedCard({
    super.key,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
            top: 20,
          ) +
          const EdgeInsets.symmetric(
            horizontal: 20,
          ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width * 0.43,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
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
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  breed.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      breed.origin,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Intelligence:",
                          style: TextStyle(fontSize: 14),
                        ),
                        RatingBar.builder(
                          unratedColor: const Color(0xffd8d8d8),
                          direction: Axis.horizontal,
                          itemSize: 22,
                          ignoreGestures: true,
                          itemCount: 5,
                          initialRating: breed.intelligence.toDouble(),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (_) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
