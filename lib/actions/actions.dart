import '/anunciante/componentes/map_google/map_google_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future whatsapp(
  BuildContext context, {
  required DocumentReference? ref,
  required String? whatsappt,
}) async {
  await ref!.update({
    ...mapToFirestore(
      {
        'ConversasWhatsapp': FieldValue.increment(1.0),
      },
    ),
  });
  await launchURL(whatsappt!);
}

Future instagram(
  BuildContext context, {
  String? instagramt,
}) async {
  await launchURL(instagramt!);
}

Future facebook(
  BuildContext context, {
  String? facebookl,
}) async {
  await launchURL(facebookl!);
}

Future maps(
  BuildContext context, {
  required LatLng? mapa,
  required String? endereco,
  required DocumentReference? refAnunciante,
}) async {
  await refAnunciante!.update({
    ...mapToFirestore(
      {
        'visualizacaoMapa': FieldValue.increment(1.0),
      },
    ),
  });
  await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return WebViewAware(
        child: Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: MapGoogleWidget(
            google: mapa!,
            endereco: endereco,
          ),
        ),
      );
    },
  );
}

Future call(
  BuildContext context, {
  required String? telefone,
  required DocumentReference? ref,
}) async {
  await ref!.update({
    ...mapToFirestore(
      {
        'Ligacaoes': FieldValue.increment(1.0),
      },
    ),
  });
  await launchURL(telefone!);
}
