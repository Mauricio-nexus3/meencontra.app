import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn
            ? entryPage ?? FeedWidget()
            : IndexWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? FeedWidget()
              : IndexWidget(),
          routes: [
            FFRoute(
              name: 'Index',
              path: 'index',
              builder: (context, params) => IndexWidget(),
            ),
            FFRoute(
              name: 'Categorias',
              path: 'categorias',
              requireAuth: true,
              builder: (context, params) => CategoriasWidget(),
            ),
            FFRoute(
              name: 'Resultado',
              path: 'resultado',
              requireAuth: true,
              builder: (context, params) => ResultadoWidget(
                total: params.getParam(
                  'total',
                  ParamType.double,
                ),
                subCategoria: params.getParam(
                  'subCategoria',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'SubCtegoria',
              path: 'subCtegoria',
              requireAuth: true,
              builder: (context, params) => SubCtegoriaWidget(
                subCategoria: params.getParam(
                  'subCategoria',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Categorias'],
                ),
              ),
            ),
            FFRoute(
              name: 'ForgotPassword',
              path: 'forgotPassword',
              requireAuth: true,
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'NovoAnunciante',
              path: 'NovoAnunciante',
              requireAuth: true,
              builder: (context, params) => NovoAnuncianteWidget(),
            ),
            FFRoute(
              name: 'Suporte',
              path: 'suporte',
              requireAuth: true,
              builder: (context, params) => SuporteWidget(
                usuarioRef: params.getParam(
                  'usuarioRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'myProfile',
              path: 'myProfile',
              requireAuth: true,
              builder: (context, params) => MyProfileWidget(),
            ),
            FFRoute(
              name: 'LinkExterno',
              path: 'linkExterno',
              requireAuth: true,
              builder: (context, params) => LinkExternoWidget(
                linkExterno: params.getParam(
                  'linkExterno',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'PoliticaPrivacidade',
              path: 'politicaPrivacidade',
              builder: (context, params) => PoliticaPrivacidadeWidget(),
            ),
            FFRoute(
              name: 'TermosDeUso',
              path: 'termosDeUso',
              builder: (context, params) => TermosDeUsoWidget(),
            ),
            FFRoute(
              name: 'Bloqueio',
              path: 'bloqueio',
              requireAuth: true,
              builder: (context, params) => BloqueioWidget(
                anuncianteREF: params.getParam(
                  'anuncianteREF',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Anunciante'],
                ),
              ),
            ),
            FFRoute(
              name: 'meinformaDetalhesNoticia',
              path: 'meinformaDetalhesNoticia',
              requireAuth: true,
              asyncParams: {
                'materiadoc': getDoc(
                    ['meInforma', 'Materias'], MateriasRecord.fromSnapshot),
              },
              builder: (context, params) => MeinformaDetalhesNoticiaWidget(
                materiadoc: params.getParam(
                  'materiadoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'PerfilImprensa',
              path: 'perfilImprensa',
              requireAuth: true,
              builder: (context, params) => PerfilImprensaWidget(
                imprensaRef: params.getParam(
                  'imprensaRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['meInforma'],
                ),
              ),
            ),
            FFRoute(
              name: 'CadastroInicial',
              path: 'cadastroInicial',
              requireAuth: true,
              builder: (context, params) => CadastroInicialWidget(),
            ),
            FFRoute(
              name: 'ValidarEmail',
              path: 'validarEmail',
              requireAuth: true,
              builder: (context, params) => ValidarEmailWidget(),
            ),
            FFRoute(
              name: 'meInforma',
              path: 'meInforma',
              builder: (context, params) => MeInformaWidget(),
            ),
            FFRoute(
              name: 'meContrata',
              path: 'meContrata',
              builder: (context, params) => MeContrataWidget(),
            ),
            FFRoute(
              name: 'meContrataDetalhesVaga',
              path: 'meContrataDetalhesVaga',
              requireAuth: true,
              asyncParams: {
                'vagaRef': getDoc(
                    ['meContrataVAGAS'], MeContrataVAGASRecord.fromSnapshot),
              },
              builder: (context, params) => MeContrataDetalhesVagaWidget(
                vagaRef: params.getParam(
                  'vagaRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'meDivirta',
              path: 'meDivirta',
              builder: (context, params) => MeDivirtaWidget(),
            ),
            FFRoute(
              name: 'meDivirtiDetalhesEvento',
              path: 'meDivirtiDetalhesEvento',
              requireAuth: true,
              asyncParams: {
                'eventoRef':
                    getDoc(['meDiverte'], MeDiverteRecord.fromSnapshot),
              },
              builder: (context, params) => MeDivirtiDetalhesEventoWidget(
                eventoRef: params.getParam(
                  'eventoRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'cadastrarMateria',
              path: 'cadastrarMateria',
              requireAuth: true,
              asyncParams: {
                'materiaDoc': getDoc(
                    ['meInforma', 'Materias'], MateriasRecord.fromSnapshot),
              },
              builder: (context, params) => CadastrarMateriaWidget(
                status: params.getParam<Status>(
                  'status',
                  ParamType.Enum,
                ),
                materiaDoc: params.getParam(
                  'materiaDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'CriarNovaVaga',
              path: 'criarNovaVaga',
              requireAuth: true,
              asyncParams: {
                'vagaDoc': getDoc(
                    ['meContrataVAGAS'], MeContrataVAGASRecord.fromSnapshot),
              },
              builder: (context, params) => CriarNovaVagaWidget(
                status: params.getParam<Status>(
                  'status',
                  ParamType.Enum,
                ),
                vagaDoc: params.getParam(
                  'vagaDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'CriarNovoEvento',
              path: 'criarNovoEvento',
              requireAuth: true,
              asyncParams: {
                'eventoDoc':
                    getDoc(['meDiverte'], MeDiverteRecord.fromSnapshot),
              },
              builder: (context, params) => CriarNovoEventoWidget(
                status: params.getParam<Status>(
                  'status',
                  ParamType.Enum,
                ),
                eventoDoc: params.getParam(
                  'eventoDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Perfil',
              path: 'perfil',
              requireAuth: true,
              builder: (context, params) => PerfilWidget(),
            ),
            FFRoute(
              name: 'meDashboardAnunciantes',
              path: 'meDashboardAnunciantes',
              requireAuth: true,
              builder: (context, params) => MeDashboardAnunciantesWidget(),
            ),
            FFRoute(
              name: 'meDashboard',
              path: 'meDashboard',
              requireAuth: true,
              builder: (context, params) => MeDashboardWidget(),
            ),
            FFRoute(
              name: 'meDashboardmecontrata',
              path: 'meDashboardmecontrata',
              requireAuth: true,
              builder: (context, params) => MeDashboardmecontrataWidget(),
            ),
            FFRoute(
              name: 'meDashboardmedivirta',
              path: 'meDashboardmedivirta',
              requireAuth: true,
              builder: (context, params) => MeDashboardmedivirtaWidget(),
            ),
            FFRoute(
              name: 'meDashboardNotificacao',
              path: 'meDashboardNotificacao',
              requireAuth: true,
              builder: (context, params) => MeDashboardNotificacaoWidget(),
            ),
            FFRoute(
              name: 'meDashboardUsuarios',
              path: 'meDashboardUsuarios',
              requireAuth: true,
              builder: (context, params) => MeDashboardUsuariosWidget(),
            ),
            FFRoute(
              name: 'meDashboardmeinforma',
              path: 'meDashboardmeinforma',
              requireAuth: true,
              builder: (context, params) => MeDashboardmeinformaWidget(),
            ),
            FFRoute(
              name: 'testeAtual',
              path: 'testeAtual',
              requireAuth: true,
              builder: (context, params) => TesteAtualWidget(),
            ),
            FFRoute(
              name: 'AnunciantePerfil',
              path: 'anunciantePerfil',
              builder: (context, params) => AnunciantePerfilWidget(
                referenciaAnunciante: params.getParam(
                  'referenciaAnunciante',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Anunciante'],
                ),
              ),
            ),
            FFRoute(
              name: 'DashAnuncianteCatalogo',
              path: 'dashAnuncianteCatalogo',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashAnuncianteCatalogoWidget(
                anuncianteDoc: params.getParam(
                  'anuncianteDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'DashAnunciantevagas',
              path: 'dashAnunciantevagas',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashAnunciantevagasWidget(
                anuncianteDoc: params.getParam(
                  'anuncianteDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'DashAnuncianteSuporte',
              path: 'dashAnuncianteSuporte',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashAnuncianteSuporteWidget(
                anuncianteDoc: params.getParam(
                  'anuncianteDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Feed',
              path: 'feed',
              builder: (context, params) => FeedWidget(),
            ),
            FFRoute(
              name: 'AnunciantePage',
              path: 'anunciantePage',
              asyncParams: {
                'documentoRefAnunciante':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => AnunciantePageWidget(
                documentoRefAnunciante: params.getParam(
                  'documentoRefAnunciante',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'notificacoes',
              path: 'notificacoes',
              requireAuth: true,
              builder: (context, params) => NotificacoesWidget(),
            ),
            FFRoute(
              name: 'DashAnuncianteAssinatura',
              path: 'dashAnuncianteAssinatura',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashAnuncianteAssinaturaWidget(
                anuncianteDoc: params.getParam(
                  'anuncianteDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'meDashboardSuporte',
              path: 'meDashboardSuporte',
              requireAuth: true,
              builder: (context, params) => MeDashboardSuporteWidget(),
            ),
            FFRoute(
              name: 'configuracoes',
              path: 'configuracoes',
              requireAuth: true,
              builder: (context, params) => ConfiguracoesWidget(),
            ),
            FFRoute(
              name: 'impreendimentos',
              path: 'impreendimentos',
              requireAuth: true,
              builder: (context, params) => ImpreendimentosWidget(),
            ),
            FFRoute(
              name: 'TonyAssist',
              path: 'tonyAssist',
              requireAuth: true,
              builder: (context, params) => TonyAssistWidget(),
            ),
            FFRoute(
              name: 'meuperfil',
              path: 'meuperfil',
              requireAuth: true,
              builder: (context, params) => MeuperfilWidget(),
            ),
            FFRoute(
              name: 'definirImg',
              path: 'definirImg',
              requireAuth: true,
              builder: (context, params) => DefinirImgWidget(
                status: params.getParam<Status>(
                  'status',
                  ParamType.Enum,
                ),
              ),
            ),
            FFRoute(
              name: 'tema',
              path: 'tema',
              requireAuth: true,
              builder: (context, params) => TemaWidget(),
            ),
            FFRoute(
              name: 'localizacao',
              path: 'localizacao',
              requireAuth: true,
              builder: (context, params) => LocalizacaoWidget(),
            ),
            FFRoute(
              name: 'edit',
              path: 'edit',
              requireAuth: true,
              builder: (context, params) => EditWidget(
                input: params.getParam(
                  'input',
                  ParamType.String,
                ),
                title: params.getParam(
                  'title',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'optionsNotification',
              path: 'optionsNotification',
              requireAuth: true,
              builder: (context, params) => OptionsNotificationWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/index';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).primary,
                      child: Center(
                        child: Image.asset(
                          'assets/images/icone_me_encontra_sem_fundo.png',
                          width: 120.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 300),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();

    // Handle erroneous links from Firebase Dynamic Links.

    String? location;

    /*
    Handle `links` routes that have dynamic-link entangled with deep-link 
    */
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.queryParameters.containsKey('deep_link_id')) {
      final deepLinkId = widget.state.uri.queryParameters['deep_link_id'];
      if (deepLinkId != null) {
        final deepLinkUri = Uri.parse(deepLinkId);
        final link = deepLinkUri.toString();
        final host = deepLinkUri.host;
        location = link.split(host).last;
      }
    }

    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      location = '/';
    }

    if (location != null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => context.go(location!));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
