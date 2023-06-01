import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final fontStyle = Theme.of(context).textTheme;
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double
                .infinity, //double/infinity significa dale todo el ancho que puedas.
            child: Row(
              children: [
                Icon(
                  Icons.movie_outlined,
                  color: colors.primary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Cinemapedia',
                  style: fontStyle.titleMedium,
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
