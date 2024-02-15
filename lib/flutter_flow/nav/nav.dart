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

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? NavBarPage() : IndexWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : IndexWidget(),
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
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Categorias')
                  : CategoriasWidget(),
            ),
            FFRoute(
              name: 'Feed',
              path: 'feed',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Feed')
                  : FeedWidget(),
            ),
            FFRoute(
              name: 'Anunciante',
              path: 'anunciante',
              builder: (context, params) => AnuncianteWidget(
                refAnunciante: params.getParam('refAnunciante',
                    ParamType.DocumentReference, false, ['Anunciante']),
              ),
            ),
            FFRoute(
              name: 'Resultado',
              path: 'resultado',
              requireAuth: true,
              builder: (context, params) => ResultadoWidget(
                subCategoriasResultRef: params.getParam(
                    'subCategoriasResultRef',
                    ParamType.DocumentReference,
                    false,
                    ['SubCategorias']),
              ),
            ),
            FFRoute(
              name: 'SubCtegoria',
              path: 'subCtegoria',
              requireAuth: true,
              builder: (context, params) => SubCtegoriaWidget(
                subCategoria: params.getParam('subCategoria',
                    ParamType.DocumentReference, false, ['Categorias']),
              ),
            ),
            FFRoute(
              name: 'ForgotPassword',
              path: 'forgotPassword',
              requireAuth: true,
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'BuscaAvancada',
              path: 'buscaAvancada',
              requireAuth: true,
              builder: (context, params) => BuscaAvancadaWidget(),
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
                usuarioRef: params.getParam('usuarioRef',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'EditarPerfil',
              path: 'editarPerfil',
              requireAuth: true,
              builder: (context, params) => EditarPerfilWidget(
                usuarioREF: params.getParam('usuarioREF',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'DashboardAnuncios',
              path: 'dashboardAnuncios',
              requireAuth: true,
              builder: (context, params) => DashboardAnunciosWidget(
                dashboardAnuncios: params.getParam('dashboardAnuncios',
                    ParamType.DocumentReference, false, ['Anunciante']),
              ),
            ),
            FFRoute(
              name: 'DashboardCatalogo',
              path: 'dashboardCatalogo',
              requireAuth: true,
              builder: (context, params) => DashboardCatalogoWidget(
                dashMenuCatalogo: params.getParam('dashMenuCatalogo',
                    ParamType.DocumentReference, false, ['Anunciante']),
              ),
            ),
            FFRoute(
              name: 'LinkExterno',
              path: 'linkExterno',
              requireAuth: true,
              builder: (context, params) => LinkExternoWidget(
                linkExterno: params.getParam('linkExterno', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SuporteAnunciante',
              path: 'suporteAnunciante',
              requireAuth: true,
              builder: (context, params) => SuporteAnuncianteWidget(
                anuncianteRef: params.getParam('anuncianteRef',
                    ParamType.DocumentReference, false, ['Anunciante']),
              ),
            ),
            FFRoute(
              name: 'PoliticaPrivacidade',
              path: 'politicaPrivacidade',
              builder: (context, params) => PoliticaPrivacidadeWidget(),
            ),
            FFRoute(
              name: 'sucesso',
              path: 'sucesso',
              requireAuth: true,
              builder: (context, params) => SucessoWidget(
                anuncianteREF: params.getParam('anuncianteREF',
                    ParamType.DocumentReference, false, ['Anunciante']),
              ),
            ),
            FFRoute(
              name: 'PagamentoInterno',
              path: 'pagamentoInterno',
              requireAuth: true,
              builder: (context, params) => PagamentoInternoWidget(
                anuncianteREF: params.getParam('anuncianteREF',
                    ParamType.DocumentReference, false, ['Anunciante']),
              ),
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
                anuncianteREF: params.getParam('anuncianteREF',
                    ParamType.DocumentReference, false, ['Anunciante']),
              ),
            ),
            FFRoute(
              name: 'meinformaDetalhesNoticia',
              path: 'meinformaDetalhesNoticia',
              requireAuth: true,
              builder: (context, params) => MeinformaDetalhesNoticiaWidget(
                materiaRef: params.getParam(
                    'materiaRef',
                    ParamType.DocumentReference,
                    false,
                    ['meInforma', 'Materias']),
              ),
            ),
            FFRoute(
              name: 'TVGON',
              path: 'tvgon',
              requireAuth: true,
              builder: (context, params) => TvgonWidget(
                imprensaRef: params.getParam('imprensaRef',
                    ParamType.DocumentReference, false, ['meInforma']),
              ),
            ),
            FFRoute(
              name: 'CadastroInicial',
              path: 'cadastroInicial',
              requireAuth: true,
              builder: (context, params) => CadastroInicialWidget(),
            ),
            FFRoute(
              name: 'ConcluirCadastro',
              path: 'concluirCadastro',
              requireAuth: true,
              builder: (context, params) => ConcluirCadastroWidget(
                anuncianteRef: params.getParam('anuncianteRef',
                    ParamType.DocumentReference, false, ['Anunciante']),
              ),
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
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'meInforma')
                  : MeInformaWidget(),
            ),
            FFRoute(
              name: 'meContrata',
              path: 'meContrata',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'meContrata')
                  : MeContrataWidget(),
            ),
            FFRoute(
              name: 'meContrataDetalhesVaga',
              path: 'meContrataDetalhesVaga',
              requireAuth: true,
              builder: (context, params) => MeContrataDetalhesVagaWidget(
                vagaRef: params.getParam('vagaRef', ParamType.DocumentReference,
                    false, ['meContrataVAGAS']),
              ),
            ),
            FFRoute(
              name: 'meDivirta',
              path: 'meDivirta',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'meDivirta')
                  : MeDivirtaWidget(),
            ),
            FFRoute(
              name: 'meDivirtiDetalhesEvento',
              path: 'meDivirtiDetalhesEvento',
              requireAuth: true,
              builder: (context, params) => MeDivirtiDetalhesEventoWidget(
                eventoRef: params.getParam('eventoRef',
                    ParamType.DocumentReference, false, ['meDiverte']),
              ),
            ),
            FFRoute(
              name: 'CriarNovaMateria',
              path: 'criarNovaMateria',
              requireAuth: true,
              builder: (context, params) => CriarNovaMateriaWidget(
                goRef: params.getParam(
                    'goRef', ParamType.DocumentReference, false, ['meInforma']),
              ),
            ),
            FFRoute(
              name: 'CriarNovaVaga',
              path: 'criarNovaVaga',
              requireAuth: true,
              builder: (context, params) => CriarNovaVagaWidget(),
            ),
            FFRoute(
              name: 'CriarNovoEvento',
              path: 'criarNovoEvento',
              requireAuth: true,
              builder: (context, params) => CriarNovoEventoWidget(),
            ),
            FFRoute(
              name: 'EditarMateria',
              path: 'editarMateria',
              requireAuth: true,
              builder: (context, params) => EditarMateriaWidget(
                materiaRef: params.getParam(
                    'materiaRef',
                    ParamType.DocumentReference,
                    false,
                    ['meInforma', 'Materias']),
              ),
            ),
            FFRoute(
              name: 'EditarVaga',
              path: 'editarVaga',
              requireAuth: true,
              builder: (context, params) => EditarVagaWidget(
                editarVaga: params.getParam('editarVaga',
                    ParamType.DocumentReference, false, ['meContrataVAGAS']),
              ),
            ),
            FFRoute(
              name: 'EditarEvento',
              path: 'editarEvento',
              requireAuth: true,
              builder: (context, params) => EditarEventoWidget(
                eventoRef: params.getParam('eventoRef',
                    ParamType.DocumentReference, false, ['meDiverte']),
              ),
            ),
            FFRoute(
              name: 'CriarPerfil',
              path: 'criarPerfil',
              requireAuth: true,
              builder: (context, params) => CriarPerfilWidget(
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'testemarkdown',
              path: 'testemarkdown',
              requireAuth: true,
              builder: (context, params) => TestemarkdownWidget(),
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
              name: 'DetalhesProduto',
              path: 'detalhesProduto',
              requireAuth: true,
              asyncParams: {
                'detalhesProduto': getDoc(
                    ['Anunciante', 'Produto'], ProdutoRecord.fromSnapshot),
                'anunciante':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
                'carrinhoDeComprasUsuarioDoc': getDoc(
                    ['users', 'CarrinhoDeComprasUsuario'],
                    CarrinhoDeComprasUsuarioRecord.fromSnapshot),
              },
              builder: (context, params) => DetalhesProdutoWidget(
                detalhesProduto:
                    params.getParam('detalhesProduto', ParamType.Document),
                anunciante: params.getParam('anunciante', ParamType.Document),
                carrinhoDeComprasUsuarioDoc: params.getParam(
                    'carrinhoDeComprasUsuarioDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'DashboardNwAnunciante',
              path: 'dashboardNwAnunciante',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashboardNwAnuncianteWidget(
                anuncianteDoc:
                    params.getParam('anuncianteDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'testeAtual',
              path: 'testeAtual',
              requireAuth: true,
              builder: (context, params) => TesteAtualWidget(),
            ),
            FFRoute(
              name: 'AnuncianteCopy',
              path: 'anuncianteCopy',
              asyncParams: {
                'documentoRefAnunciante':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => AnuncianteCopyWidget(
                documentoRefAnunciante: params.getParam(
                    'documentoRefAnunciante', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'Produtos',
              path: 'produtos',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => ProdutosWidget(
                anuncianteDoc:
                    params.getParam('anuncianteDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'catalogoCategoria',
              path: 'catalogoCategoria',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => CatalogoCategoriaWidget(
                anuncianteDoc:
                    params.getParam('anuncianteDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'DashboardNWAnuncios',
              path: 'dashboardNWAnuncios',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashboardNWAnunciosWidget(
                anuncianteDoc:
                    params.getParam('anuncianteDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'DashboardNWvagas',
              path: 'dashboardNWvagas',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashboardNWvagasWidget(
                anuncianteDoc:
                    params.getParam('anuncianteDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'DashboardNWSuporte',
              path: 'dashboardNWSuporte',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashboardNWSuporteWidget(
                anuncianteDoc:
                    params.getParam('anuncianteDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditarPerfilUsuario',
              path: 'editarPerfilUsuario',
              requireAuth: true,
              asyncParams: {
                'usuarioREF': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => EditarPerfilUsuarioWidget(
                usuarioREF: params.getParam('usuarioREF', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'detalhesProduto2',
              path: 'detalhesProduto2',
              requireAuth: true,
              asyncParams: {
                'detalheProduto': getDoc(
                    ['Anunciante', 'Produto'], ProdutoRecord.fromSnapshot),
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DetalhesProduto2Widget(
                detalheProduto:
                    params.getParam('detalheProduto', ParamType.Document),
                anuncianteDoc:
                    params.getParam('anuncianteDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'FeedCopy',
              path: 'feedCopy',
              builder: (context, params) => FeedCopyWidget(),
            ),
            FFRoute(
              name: 'AnuncianteDashboard',
              path: 'anuncianteDashboard',
              asyncParams: {
                'documentoRefAnunciante':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => AnuncianteDashboardWidget(
                documentoRefAnunciante: params.getParam(
                    'documentoRefAnunciante', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'notificacoes',
              path: 'notificacoes',
              requireAuth: true,
              asyncParams: {
                'notificacoes':
                    getDocList(['notificacao'], NotificacaoRecord.fromSnapshot),
              },
              builder: (context, params) => NotificacoesWidget(
                notificacoes: params.getParam<NotificacaoRecord>(
                    'notificacoes', ParamType.Document, true),
              ),
            ),
            FFRoute(
              name: 'SubCtegoriaCopy2',
              path: 'subCtegoriaCopy2',
              requireAuth: true,
              asyncParams: {
                'categoriaDoc':
                    getDoc(['Categorias'], CategoriasRecord.fromSnapshot),
              },
              builder: (context, params) => SubCtegoriaCopy2Widget(
                subCategoriaRefExcluir: params.getParam(
                    'subCategoriaRefExcluir',
                    ParamType.DocumentReference,
                    false,
                    ['Categorias']),
                categoriaDoc:
                    params.getParam('categoriaDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'DashboardNWAssinatura',
              path: 'dashboardNWAssinatura',
              requireAuth: true,
              asyncParams: {
                'anuncianteDoc':
                    getDoc(['Anunciante'], AnuncianteRecord.fromSnapshot),
              },
              builder: (context, params) => DashboardNWAssinaturaWidget(
                anuncianteDoc:
                    params.getParam('anuncianteDoc', ParamType.Document),
              ),
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
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/index';
          }
          return null;
        },
        pageBuilder: (context, state) {
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
    if (widget.state.location.startsWith('/link') &&
        widget.state.location.contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
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
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
