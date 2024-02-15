import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ultimaNotificacao = prefs.containsKey('ff_ultimaNotificacao')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_ultimaNotificacao')!)
          : _ultimaNotificacao;
    });
    _safeInit(() {
      _acaoDeAtualizacao =
          prefs.getBool('ff_acaoDeAtualizacao') ?? _acaoDeAtualizacao;
    });
    _safeInit(() {
      _resetarNotificacao = prefs.containsKey('ff_resetarNotificacao')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_resetarNotificacao')!)
          : _resetarNotificacao;
    });
    _safeInit(() {
      _ultimaAtualizacao =
          prefs.getString('ff_ultimaAtualizacao') ?? _ultimaAtualizacao;
    });
    _safeInit(() {
      _resetarAtualizacao =
          prefs.getString('ff_resetarAtualizacao') ?? _resetarAtualizacao;
    });
    _safeInit(() {
      _OrdemAnunciosPlus = prefs
              .getStringList('ff_OrdemAnunciosPlus')
              ?.map(double.parse)
              .toList() ??
          _OrdemAnunciosPlus;
    });
    _safeInit(() {
      _OrdemAnunciosPlusSTRING =
          prefs.getStringList('ff_OrdemAnunciosPlusSTRING') ??
              _OrdemAnunciosPlusSTRING;
    });
    _safeInit(() {
      _qntdItensCarrinho =
          prefs.getInt('ff_qntdItensCarrinho') ?? _qntdItensCarrinho;
    });
    _safeInit(() {
      _nomesProdutosCarrinhoUsuer =
          prefs.getStringList('ff_nomesProdutosCarrinhoUsuer') ??
              _nomesProdutosCarrinhoUsuer;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _EsconderDaTela = false;
  bool get EsconderDaTela => _EsconderDaTela;
  set EsconderDaTela(bool _value) {
    _EsconderDaTela = _value;
  }

  bool _horarioAtendimento = false;
  bool get horarioAtendimento => _horarioAtendimento;
  set horarioAtendimento(bool _value) {
    _horarioAtendimento = _value;
  }

  List<String> _listaImgsDeletar = [];
  List<String> get listaImgsDeletar => _listaImgsDeletar;
  set listaImgsDeletar(List<String> _value) {
    _listaImgsDeletar = _value;
  }

  void addToListaImgsDeletar(String _value) {
    _listaImgsDeletar.add(_value);
  }

  void removeFromListaImgsDeletar(String _value) {
    _listaImgsDeletar.remove(_value);
  }

  void removeAtIndexFromListaImgsDeletar(int _index) {
    _listaImgsDeletar.removeAt(_index);
  }

  void updateListaImgsDeletarAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listaImgsDeletar[_index] = updateFn(_listaImgsDeletar[_index]);
  }

  void insertAtIndexInListaImgsDeletar(int _index, String _value) {
    _listaImgsDeletar.insert(_index, _value);
  }

  DateTime? _VarDataPagamento =
      DateTime.fromMillisecondsSinceEpoch(1704078060000);
  DateTime? get VarDataPagamento => _VarDataPagamento;
  set VarDataPagamento(DateTime? _value) {
    _VarDataPagamento = _value;
  }

  DateTime? _ultimaNotificacao =
      DateTime.fromMillisecondsSinceEpoch(1701856800000);
  DateTime? get ultimaNotificacao => _ultimaNotificacao;
  set ultimaNotificacao(DateTime? _value) {
    _ultimaNotificacao = _value;
    _value != null
        ? prefs.setInt('ff_ultimaNotificacao', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_ultimaNotificacao');
  }

  bool _acaoDeAtualizacao = false;
  bool get acaoDeAtualizacao => _acaoDeAtualizacao;
  set acaoDeAtualizacao(bool _value) {
    _acaoDeAtualizacao = _value;
    prefs.setBool('ff_acaoDeAtualizacao', _value);
  }

  DateTime? _resetarNotificacao =
      DateTime.fromMillisecondsSinceEpoch(1701857100000);
  DateTime? get resetarNotificacao => _resetarNotificacao;
  set resetarNotificacao(DateTime? _value) {
    _resetarNotificacao = _value;
    _value != null
        ? prefs.setInt('ff_resetarNotificacao', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_resetarNotificacao');
  }

  String _ultimaAtualizacao = '2.0.1';
  String get ultimaAtualizacao => _ultimaAtualizacao;
  set ultimaAtualizacao(String _value) {
    _ultimaAtualizacao = _value;
    prefs.setString('ff_ultimaAtualizacao', _value);
  }

  String _resetarAtualizacao = '2.0.1';
  String get resetarAtualizacao => _resetarAtualizacao;
  set resetarAtualizacao(String _value) {
    _resetarAtualizacao = _value;
    prefs.setString('ff_resetarAtualizacao', _value);
  }

  List<double> _OrdemAnunciosPlus = [];
  List<double> get OrdemAnunciosPlus => _OrdemAnunciosPlus;
  set OrdemAnunciosPlus(List<double> _value) {
    _OrdemAnunciosPlus = _value;
    prefs.setStringList(
        'ff_OrdemAnunciosPlus', _value.map((x) => x.toString()).toList());
  }

  void addToOrdemAnunciosPlus(double _value) {
    _OrdemAnunciosPlus.add(_value);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  void removeFromOrdemAnunciosPlus(double _value) {
    _OrdemAnunciosPlus.remove(_value);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromOrdemAnunciosPlus(int _index) {
    _OrdemAnunciosPlus.removeAt(_index);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  void updateOrdemAnunciosPlusAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _OrdemAnunciosPlus[_index] = updateFn(_OrdemAnunciosPlus[_index]);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  void insertAtIndexInOrdemAnunciosPlus(int _index, double _value) {
    _OrdemAnunciosPlus.insert(_index, _value);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  List<String> _OrdemAnunciosPlusSTRING = [];
  List<String> get OrdemAnunciosPlusSTRING => _OrdemAnunciosPlusSTRING;
  set OrdemAnunciosPlusSTRING(List<String> _value) {
    _OrdemAnunciosPlusSTRING = _value;
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _value);
  }

  void addToOrdemAnunciosPlusSTRING(String _value) {
    _OrdemAnunciosPlusSTRING.add(_value);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  void removeFromOrdemAnunciosPlusSTRING(String _value) {
    _OrdemAnunciosPlusSTRING.remove(_value);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  void removeAtIndexFromOrdemAnunciosPlusSTRING(int _index) {
    _OrdemAnunciosPlusSTRING.removeAt(_index);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  void updateOrdemAnunciosPlusSTRINGAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _OrdemAnunciosPlusSTRING[_index] =
        updateFn(_OrdemAnunciosPlusSTRING[_index]);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  void insertAtIndexInOrdemAnunciosPlusSTRING(int _index, String _value) {
    _OrdemAnunciosPlusSTRING.insert(_index, _value);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  int _qntdItensCarrinho = 0;
  int get qntdItensCarrinho => _qntdItensCarrinho;
  set qntdItensCarrinho(int _value) {
    _qntdItensCarrinho = _value;
    prefs.setInt('ff_qntdItensCarrinho', _value);
  }

  List<String> _nomesProdutosCarrinhoUsuer = [];
  List<String> get nomesProdutosCarrinhoUsuer => _nomesProdutosCarrinhoUsuer;
  set nomesProdutosCarrinhoUsuer(List<String> _value) {
    _nomesProdutosCarrinhoUsuer = _value;
    prefs.setStringList('ff_nomesProdutosCarrinhoUsuer', _value);
  }

  void addToNomesProdutosCarrinhoUsuer(String _value) {
    _nomesProdutosCarrinhoUsuer.add(_value);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  void removeFromNomesProdutosCarrinhoUsuer(String _value) {
    _nomesProdutosCarrinhoUsuer.remove(_value);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  void removeAtIndexFromNomesProdutosCarrinhoUsuer(int _index) {
    _nomesProdutosCarrinhoUsuer.removeAt(_index);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  void updateNomesProdutosCarrinhoUsuerAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nomesProdutosCarrinhoUsuer[_index] =
        updateFn(_nomesProdutosCarrinhoUsuer[_index]);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  void insertAtIndexInNomesProdutosCarrinhoUsuer(int _index, String _value) {
    _nomesProdutosCarrinhoUsuer.insert(_index, _value);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  Color _corSelecionadaAnunciante = Color(4285005984);
  Color get corSelecionadaAnunciante => _corSelecionadaAnunciante;
  set corSelecionadaAnunciante(Color _value) {
    _corSelecionadaAnunciante = _value;
  }

  String _templeteLayoutSelecionado = '';
  String get templeteLayoutSelecionado => _templeteLayoutSelecionado;
  set templeteLayoutSelecionado(String _value) {
    _templeteLayoutSelecionado = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
