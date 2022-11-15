import 'package:flutter/material.dart';

var placesTheme = ThemeData(
  // Definición de la familia de la fuente
  fontFamily: 'Roboto',
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    // Estilo de fuente para texto de Guatemala
    headline6: TextStyle(
      color: Colors.black,
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ),
    // Estilo de fuente para texto de Corazón del mundo maya
    subtitle1: TextStyle(
      color: Color(0xFF727272),
      fontSize: 15.5,
      fontWeight: FontWeight.w400,
    ),
    // Estilo de fuente para texto de nombres de lugares en carrousel principal
    headline5: TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.w500,
    ),
    // Estilo de fuente para texto de descripción de lugares eb carrousel principal
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    // Estilo de fuente para texto de nombres de lugares en carrousel principal
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
  ),
);
