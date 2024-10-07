import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'definir_img_model.dart';
export 'definir_img_model.dart';

class DefinirImgWidget extends StatefulWidget {
  const DefinirImgWidget({
    super.key,
    required this.status,
  });

  final Status? status;

  @override
  State<DefinirImgWidget> createState() => _DefinirImgWidgetState();
}

class _DefinirImgWidgetState extends State<DefinirImgWidget>
    with TickerProviderStateMixin {
  late DefinirImgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefinirImgModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'definirImg'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'definirImg',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 24.0,
                buttonSize: 54.0,
                fillColor: Color(0x15FFFFFF),
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: FlutterFlowTheme.of(context).white,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('DEFINIR_IMG_arrow_back_ios_rounded_ICN_O');
                  context.pop();
                },
              ),
              title: Text(
                'Seu perfil',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Escolha uma foto ou escolha um avatar',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).accent2,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: [
                                Tab(
                                  text: 'Carregar uma foto',
                                ),
                                Tab(
                                  text: 'Escolha um avatar',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [
                                  () async {
                                    logFirebaseEvent(
                                        'DEFINIR_IMG_PAGE_Tab_n8bdnygr_ON_TAP');
                                    _model.avatar = false;
                                    safeSetState(() {});
                                  },
                                  () async {
                                    logFirebaseEvent(
                                        'DEFINIR_IMG_PAGE_Tab_t532gegm_ON_TAP');
                                    _model.avatar = true;
                                    safeSetState(() {});
                                  }
                                ][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      children: [
                                        ClipOval(
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                              ),
                                            ),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                if (_model.uploadedLocalFile1 !=
                                                        null &&
                                                    (_model
                                                            .uploadedLocalFile1
                                                            .bytes
                                                            ?.isNotEmpty ??
                                                        false))
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/286/600',
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                Text(
                                                  (_model.uploadedLocalFile1 ==
                                                              null ||
                                                          (_model
                                                                  .uploadedLocalFile1
                                                                  .bytes
                                                                  ?.isEmpty ??
                                                              true))
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 8.0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 24.0,
                                              buttonSize: 40.0,
                                              fillColor: Color(0x15FFFFFF),
                                              icon: Icon(
                                                Icons.add_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_add_rounded_ICN_ON_TAP');
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  maxWidth: 1080.00,
                                                  maxHeight: 1080.00,
                                                  imageQuality: 80,
                                                  allowPhoto: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  safeSetState(() => _model
                                                      .isDataUploading1 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();
                                                  } finally {
                                                    _model.isDataUploading1 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFile1 =
                                                          selectedUploadedFiles
                                                              .first;
                                                    });
                                                  } else {
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Wrap(
                                          spacing: 24.0,
                                          runSpacing: 24.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2001.png?alt=media&token=5bc26ffc-87c8-4f32-96a6-8af27e8bd2bb';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2001.png?alt=media&token=5bc26ffc-87c8-4f32-96a6-8af27e8bd2bb',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar02_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2002.png?alt=media&token=52e3c37e-c43f-466c-bc52-2e7ca05685bd';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar02Model,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2002.png?alt=media&token=52e3c37e-c43f-466c-bc52-2e7ca05685bd',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar03_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2003.png?alt=media&token=a198d4f9-bf00-4b47-b7e6-1ef9b15af11c';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar03Model,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2003.png?alt=media&token=a198d4f9-bf00-4b47-b7e6-1ef9b15af11c',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2004.png?alt=media&token=20ed1bda-4e77-4412-9a6c-4aaa78cc340c';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2004.png?alt=media&token=20ed1bda-4e77-4412-9a6c-4aaa78cc340c',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2005.png?alt=media&token=4c328217-078a-4bf5-9bb6-8231ae8b7089';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2005.png?alt=media&token=4c328217-078a-4bf5-9bb6-8231ae8b7089',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2006.png?alt=media&token=9c6f6aea-170b-47d7-94c6-65c38867c785';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model4,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2006.png?alt=media&token=9c6f6aea-170b-47d7-94c6-65c38867c785',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2007.png?alt=media&token=300d8bf0-dda0-498b-9e53-40a846a57212';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model5,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2007.png?alt=media&token=300d8bf0-dda0-498b-9e53-40a846a57212',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2008.png?alt=media&token=47d30f0c-8052-4c5e-90f1-fe30cbca12a0';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model6,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2008.png?alt=media&token=47d30f0c-8052-4c5e-90f1-fe30cbca12a0',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2009.png?alt=media&token=09729838-6373-47de-9e58-8a54c5270f38';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model7,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2009.png?alt=media&token=09729838-6373-47de-9e58-8a54c5270f38',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2010.png?alt=media&token=22eefc74-ab03-4126-b3dc-14df0fdf541f';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model8,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2010.png?alt=media&token=22eefc74-ab03-4126-b3dc-14df0fdf541f',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2011.png?alt=media&token=41cceace-69bc-4bcf-96dc-fe4ef80c815c';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model9,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2011.png?alt=media&token=41cceace-69bc-4bcf-96dc-fe4ef80c815c',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2012.png?alt=media&token=191d3292-69a6-49bf-a97a-1deb686718d5';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model10,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2012.png?alt=media&token=191d3292-69a6-49bf-a97a-1deb686718d5',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2013.png?alt=media&token=a7bf615e-b207-4ba4-9f11-d736048410a3';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model11,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2013.png?alt=media&token=a7bf615e-b207-4ba4-9f11-d736048410a3',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2014.png?alt=media&token=8c295f61-e7be-4fc6-a22c-e69ca363217a';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model12,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2014.png?alt=media&token=8c295f61-e7be-4fc6-a22c-e69ca363217a',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2015.png?alt=media&token=e6321074-f6e3-4d35-993c-2e66c26c419b';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model13,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2015.png?alt=media&token=e6321074-f6e3-4d35-993c-2e66c26c419b',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2016.png?alt=media&token=c906e0bc-04db-46ce-a8b1-10d2afc1931b';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model14,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2016.png?alt=media&token=c906e0bc-04db-46ce-a8b1-10d2afc1931b',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2017.png?alt=media&token=9cf9a3b1-f078-4606-84d2-df2ed44d8ee8';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model15,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2017.png?alt=media&token=9cf9a3b1-f078-4606-84d2-df2ed44d8ee8',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2018.png?alt=media&token=d54fc5a5-0c3a-4998-98fa-671d5b6e1197';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model16,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2018.png?alt=media&token=d54fc5a5-0c3a-4998-98fa-671d5b6e1197',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2003.png?alt=media&token=a198d4f9-bf00-4b47-b7e6-1ef9b15af11c';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model17,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2019.png?alt=media&token=ffc48561-7f1d-4772-8777-b44f509da2b3',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2020.png?alt=media&token=f5e788fe-f5e8-4127-9bc0-32ee86796d3b';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model18,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2020.png?alt=media&token=f5e788fe-f5e8-4127-9bc0-32ee86796d3b',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2021.png?alt=media&token=c1fc358b-57ec-4fe4-bc70-0cd00c0d7a3f';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model19,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2021.png?alt=media&token=c1fc358b-57ec-4fe4-bc70-0cd00c0d7a3f',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2022.png?alt=media&token=3331c271-5572-4fd1-898a-3fe0f7800ed9';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model20,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2022.png?alt=media&token=3331c271-5572-4fd1-898a-3fe0f7800ed9',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2023.png?alt=media&token=8e9e4b24-07bc-49b1-9da0-8b4eea8947f1';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model21,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2023.png?alt=media&token=8e9e4b24-07bc-49b1-9da0-8b4eea8947f1',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2024.png?alt=media&token=6eaf235e-9c60-4dd4-a29c-4f61f945ab10';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model22,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2024.png?alt=media&token=6eaf235e-9c60-4dd4-a29c-4f61f945ab10',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2025.png?alt=media&token=5a7374eb-5037-4770-b14e-ff2590d0c378';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model23,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2025.png?alt=media&token=5a7374eb-5037-4770-b14e-ff2590d0c378',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2026.png?alt=media&token=8e73c240-8dff-4302-84e6-c95d4f1f3dae';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model24,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2026.png?alt=media&token=8e73c240-8dff-4302-84e6-c95d4f1f3dae',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2027.png?alt=media&token=6793c327-963b-46af-850e-4ac57ca8648d';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model25,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2027.png?alt=media&token=6793c327-963b-46af-850e-4ac57ca8648d',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2028.png?alt=media&token=0e649f6c-a69f-49a1-885e-49a135f51a54';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model26,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2028.png?alt=media&token=0e649f6c-a69f-49a1-885e-49a135f51a54',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2029.png?alt=media&token=fb8e67bd-596c-4d93-84af-f034b45dad7c';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model27,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2029.png?alt=media&token=fb8e67bd-596c-4d93-84af-f034b45dad7c',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2030.png?alt=media&token=dbc8929b-3873-45b0-a44d-86ced2fbbc0a';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model28,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2030.png?alt=media&token=dbc8929b-3873-45b0-a44d-86ced2fbbc0a',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2031.png?alt=media&token=e42a9052-24d8-4a9d-8b07-66395f1d7799';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model29,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2031.png?alt=media&token=e42a9052-24d8-4a9d-8b07-66395f1d7799',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2032.png?alt=media&token=89329579-7d3e-4bbd-8afe-519ab0c5a6bd';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model30,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2032.png?alt=media&token=89329579-7d3e-4bbd-8afe-519ab0c5a6bd',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2033.png?alt=media&token=743e0261-99b3-4ca0-926d-1de989c288c9';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model31,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2033.png?alt=media&token=743e0261-99b3-4ca0-926d-1de989c288c9',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2034.png?alt=media&token=2bf57706-123c-4743-a871-a6a7041934aa';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model32,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2034.png?alt=media&token=2bf57706-123c-4743-a871-a6a7041934aa',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2035.png?alt=media&token=c56f98b9-6caf-47a8-9f85-0843afd808bf';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model33,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2035.png?alt=media&token=c56f98b9-6caf-47a8-9f85-0843afd808bf',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2036.png?alt=media&token=27d62019-0673-4b82-85ba-9b77f213abb3';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model34,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2036.png?alt=media&token=27d62019-0673-4b82-85ba-9b77f213abb3',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2037.png?alt=media&token=01ee45c6-ee15-462b-b38b-97c33ab4e061';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model35,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2037.png?alt=media&token=01ee45c6-ee15-462b-b38b-97c33ab4e061',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2038.png?alt=media&token=1442f7d7-1609-45c3-9ed4-4443205853e1';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model36,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2038.png?alt=media&token=1442f7d7-1609-45c3-9ed4-4443205853e1',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2039.png?alt=media&token=71f62cf3-b67e-4bf9-a8c3-738b095f0847';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model37,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2039.png?alt=media&token=71f62cf3-b67e-4bf9-a8c3-738b095f0847',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2040.png?alt=media&token=5cb2b1e2-cd83-4603-a783-70b3230c7504';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model38,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2040.png?alt=media&token=5cb2b1e2-cd83-4603-a783-70b3230c7504',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2021.png?alt=media&token=c1fc358b-57ec-4fe4-bc70-0cd00c0d7a3f';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model39,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2041.png?alt=media&token=8936a37b-e5da-452d-96d7-d5f92384c08c',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DEFINIR_IMG_PAGE_avatar01_ON_TAP');
                                                FFAppState().avatarUrl =
                                                    'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2021.png?alt=media&token=c1fc358b-57ec-4fe4-bc70-0cd00c0d7a3f';
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatar01Model40,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AvatarWidget(
                                                  avatar:
                                                      'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/avatar%2Favatar%2042.png?alt=media&token=a0829b70-4ab2-437f-90d9-c34ee3b126c0',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]
                                          .divide(SizedBox(height: 16.0))
                                          .around(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            FFAppConstants.paddingMobile,
                            0.0,
                          ),
                          0.0,
                          valueOrDefault<double>(
                            FFAppConstants.paddingMobile,
                            0.0,
                          ),
                          0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'DEFINIR_IMG_PAGE_BUTTON_BTN_ON_TAP');
                          if (_model.avatar == false) {
                            {
                              safeSetState(
                                  () => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedMedia = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles =
                                    _model.uploadedLocalFile1.bytes!.isNotEmpty
                                        ? [_model.uploadedLocalFile1]
                                        : <FFUploadedFile>[];
                                selectedMedia = selectedFilesFromUploadedFiles(
                                  selectedUploadedFiles,
                                );
                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            FFAppState().avatarUrl = '';
                            safeSetState(() {});
                          }
                          // Setar o avatar na URL
                          // Ler comentário

                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrl: _model.avatar == true
                                ? FFAppState().avatarUrl
                                : _model.uploadedFileUrl2,
                          ));
                          if (widget!.status == Status.novo) {
                            context.pushNamed('localizacao');

                            return;
                          } else {
                            context.safePop();
                            return;
                          }
                        },
                        text: widget!.status == Status.novo
                            ? 'Próximo'
                            : 'Salvar alterações',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 45.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ));
  }
}
