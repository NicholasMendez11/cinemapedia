import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class CustomSliverAppbar extends StatelessWidget {
  final Movie movie;
  const CustomSliverAppbar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; //Ya tengo las dimensiones del dispositivo
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                    0.7,
                    1.0
                  ], //empieza desde el 70 % del begin y termina al 100 del end
                          colors: [
                    Colors.transparent,
                    Colors.black87
                  ]))),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          stops: [
                    0.0,
                    0.3
                  ], //empieza desde el 70 % del begin y termina al 100 del end
                          colors: [
                    Colors.black87,
                    Colors.transparent,
                  ]))),
            )
          ],
        ),
      ),
    );
  }
}
