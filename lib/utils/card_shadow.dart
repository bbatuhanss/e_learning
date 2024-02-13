import 'package:flutter/material.dart';

final cardShadow = [BoxShadow(
  color: Colors.grey.withOpacity(0.8),
  offset: const Offset(0.0, 1),
  blurRadius: 6.0,
)];

final textOnCardShadow = [Shadow(
  color: Colors.black.withOpacity(0.8),
  offset: const Offset(0.0, 0.0),
  blurRadius: 2.0,
)];

final boxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.4),
    offset: const Offset(0.0, 1),
    blurRadius: 6.0,
  ),
];

final newCardShadow = [
  BoxShadow(
    color: const Color(0xff011633).withOpacity(0.1),
    offset: const Offset(0.0, 4),
    spreadRadius: 2.0,
    blurRadius: 10.0,
  ),
];

final catalogCardShadow = [
  BoxShadow(
    color: const Color(0xff000000).withOpacity(0.25),
    offset: const Offset(0.0, 4),
    blurRadius: 4.0,
  ),
];

final systemMenuCardShadow = [
  BoxShadow(
    color: const Color(0xff143A6D).withOpacity(0.20),
    offset: const Offset(0.0, 0.0),
    blurRadius: 10.0,
  ),
];

final profileShadow = [
  BoxShadow(
    color: const Color(0xff011633).withOpacity(0.10),
    blurRadius: 7.0,
    spreadRadius: 3
  ),
];


final dropShadow = [
  const BoxShadow(
      color: Color(0xff000000),
      blurRadius: 0.0,
      spreadRadius: 0
  ),
];