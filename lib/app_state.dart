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
      if (prefs.containsKey('ff_anunciante')) {
        try {
          final serializedData = prefs.getString('ff_anunciante') ?? '{}';
          _anunciante =
              AnuncianteStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
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
      _ultimaNotificacaoAtualizacao =
          prefs.containsKey('ff_ultimaNotificacaoAtualizacao')
              ? DateTime.fromMillisecondsSinceEpoch(
                  prefs.getInt('ff_ultimaNotificacaoAtualizacao')!)
              : _ultimaNotificacaoAtualizacao;
    });
    _safeInit(() {
      _versaoNoDispositivoUsuario =
          prefs.getString('ff_versaoNoDispositivoUsuario') ??
              _versaoNoDispositivoUsuario;
    });
    _safeInit(() {
      _versaoAtualMobile =
          prefs.getString('ff_versaoAtualMobile') ?? _versaoAtualMobile;
    });
    _safeInit(() {
      _versaoAtualDesktop =
          prefs.getString('ff_versaoAtualDesktop') ?? _versaoAtualDesktop;
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
    _safeInit(() {
      _avatarUrl = prefs.getString('ff_avatarUrl') ?? _avatarUrl;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  AnuncianteStruct _anunciante = AnuncianteStruct.fromSerializableMap(
      jsonDecode('{\"nome\":\"mauricio\"}'));
  AnuncianteStruct get anunciante => _anunciante;
  set anunciante(AnuncianteStruct value) {
    _anunciante = value;
    prefs.setString('ff_anunciante', value.serialize());
  }

  void updateAnuncianteStruct(Function(AnuncianteStruct) updateFn) {
    updateFn(_anunciante);
    prefs.setString('ff_anunciante', _anunciante.serialize());
  }

  bool _EsconderDaTela = false;
  bool get EsconderDaTela => _EsconderDaTela;
  set EsconderDaTela(bool value) {
    _EsconderDaTela = value;
  }

  List<FonteStruct> _fonteMeinforma = [
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"meencontra\",\"img\":\"https://picsum.photos/seed/715/600\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"TVGO\",\"img\":\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrwNFzIi47zfUOA_c4supauqquGUK7Zh7ztA&s\",\"arroba\":\"tvgo.rs\",\"site\":\"https://www.guaiba.online/\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"O Guaíba\",\"img\":\"https://scontent-iad3-2.cdninstagram.com/v/t51.2885-19/448919241_394692600390258_4751690575187155071_n.jpg?_nc_ht=scontent-iad3-2.cdninstagram.com&_nc_cat=106&_nc_ohc=w0Tp40NYHcEQ7kNvgGo2coy&_nc_gid=274fa9c6f8d8497bb80c7f87a36a43b5&edm=AEhyXUkBAAAA&ccb=7-5&oh=00_AYCsOIXyKiTnADwTGhuuufk_o4kbV2nHaGre4w_WyiL1UQ&oe=66CAAD0F&_nc_sid=8f1549\",\"arroba\":\"jornaloguaibars\",\"site\":\"\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Repórter Guaibense\",\"img\":\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_DQppysFc5xBrI3MUDeXXPbdqq-e0osNF_w&s\",\"arroba\":\"reporterguaibense\",\"site\":\"https://www.reporterguaibense.com.br/\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Jornal do Comércio\",\"img\":\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSem9TC3SKAam6OVvBRhxKyIob-GdZX4IRgg&s\",\"arroba\":\"jornaldocomercio\",\"site\":\"https://www.jornaldocomercio.com/\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Nova Folha\",\"img\":\"https://scontent-iad3-2.cdninstagram.com/v/t51.2885-19/20347075_499306357068390_319229302610591744_a.jpg?_nc_ht=scontent-iad3-2.cdninstagram.com&_nc_cat=106&_nc_ohc=y7AqQYh5GaQQ7kNvgHdPKg1&edm=AEhyXUkBAAAA&ccb=7-5&oh=00_AYBkYZ1Tm-TnRoXii4yzszJLFHLZ0BQ32MnhrhX7XuZojQ&oe=66CAADCE&_nc_sid=8f1549\",\"arroba\":\"novafolha\",\"site\":\"https://www.novafolha.com.br/\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Rádio Guaíba\",\"img\":\"https://instagram.fcxj14-1.fna.fbcdn.net/v/t51.2885-19/440957821_970957564580544_8485342772246654254_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fcxj14-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=58Rnn4cPXPAQ7kNvgEDHW1O&edm=AFg4Q8wBAAAA&ccb=7-5&oh=00_AYAmVPpTSovCC6jtqiVLhQ5etp2Jn29upQdvWbvlnXaAPA&oe=66CAA26D&_nc_sid=0b30b7\",\"arroba\":\"rdguaibaoficial\",\"site\":\"https://guaiba.com.br/\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Porto alegre 24hrs\",\"img\":\"https://poa24horas.com.br/wp-content/uploads/2021/05/logo-poa24horas.jpg.webp\",\"arroba\":\"portoalegre24horas\",\"site\":\"https://poa24horas.com.br/\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Gazeta Centro-Sul\",\"img\":\"https://gazetacentrosul.com.br/wp-content/uploads/2021/03/Logo-Gazeta.png\",\"arroba\":\"gazetacentrosul\",\"site\":\"https://gazetacentrosul.com.br/\"}')),
    FonteStruct.fromSerializableMap(jsonDecode(
        '{\"nome\":\"Acústica FM\",\"img\":\"https://scontent.fcxj14-1.fna.fbcdn.net/v/t39.30808-6/320021220_690303562462980_5604971727656925057_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=OF_-exMBHHcQ7kNvgECx-eI&_nc_ht=scontent.fcxj14-1.fna&oh=00_AYBNt8_bK0n9llpJo7JhQnht64PHJnXj5Ma0W66Mj8yz6Q&oe=66CA9D9A\",\"arroba\":\"acusticafm\",\"site\":\"https://acusticafm.com.br/\"}'))
  ];
  List<FonteStruct> get fonteMeinforma => _fonteMeinforma;
  set fonteMeinforma(List<FonteStruct> value) {
    _fonteMeinforma = value;
  }

  void addToFonteMeinforma(FonteStruct value) {
    fonteMeinforma.add(value);
  }

  void removeFromFonteMeinforma(FonteStruct value) {
    fonteMeinforma.remove(value);
  }

  void removeAtIndexFromFonteMeinforma(int index) {
    fonteMeinforma.removeAt(index);
  }

  void updateFonteMeinformaAtIndex(
    int index,
    FonteStruct Function(FonteStruct) updateFn,
  ) {
    fonteMeinforma[index] = updateFn(_fonteMeinforma[index]);
  }

  void insertAtIndexInFonteMeinforma(int index, FonteStruct value) {
    fonteMeinforma.insert(index, value);
  }

  List<String> _listaImgsDeletar = [];
  List<String> get listaImgsDeletar => _listaImgsDeletar;
  set listaImgsDeletar(List<String> value) {
    _listaImgsDeletar = value;
  }

  void addToListaImgsDeletar(String value) {
    listaImgsDeletar.add(value);
  }

  void removeFromListaImgsDeletar(String value) {
    listaImgsDeletar.remove(value);
  }

  void removeAtIndexFromListaImgsDeletar(int index) {
    listaImgsDeletar.removeAt(index);
  }

  void updateListaImgsDeletarAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaImgsDeletar[index] = updateFn(_listaImgsDeletar[index]);
  }

  void insertAtIndexInListaImgsDeletar(int index, String value) {
    listaImgsDeletar.insert(index, value);
  }

  DateTime? _VarDataPagamento =
      DateTime.fromMillisecondsSinceEpoch(1704078060000);
  DateTime? get VarDataPagamento => _VarDataPagamento;
  set VarDataPagamento(DateTime? value) {
    _VarDataPagamento = value;
  }

  bool _acaoDeAtualizacao = false;
  bool get acaoDeAtualizacao => _acaoDeAtualizacao;
  set acaoDeAtualizacao(bool value) {
    _acaoDeAtualizacao = value;
    prefs.setBool('ff_acaoDeAtualizacao', value);
  }

  DateTime? _resetarNotificacao =
      DateTime.fromMillisecondsSinceEpoch(1701857100000);
  DateTime? get resetarNotificacao => _resetarNotificacao;
  set resetarNotificacao(DateTime? value) {
    _resetarNotificacao = value;
    value != null
        ? prefs.setInt('ff_resetarNotificacao', value.millisecondsSinceEpoch)
        : prefs.remove('ff_resetarNotificacao');
  }

  DateTime? _ultimaNotificacaoAtualizacao =
      DateTime.fromMillisecondsSinceEpoch(1701856800000);
  DateTime? get ultimaNotificacaoAtualizacao => _ultimaNotificacaoAtualizacao;
  set ultimaNotificacaoAtualizacao(DateTime? value) {
    _ultimaNotificacaoAtualizacao = value;
    value != null
        ? prefs.setInt(
            'ff_ultimaNotificacaoAtualizacao', value.millisecondsSinceEpoch)
        : prefs.remove('ff_ultimaNotificacaoAtualizacao');
  }

  String _versaoNoDispositivoUsuario = '2.0.1';
  String get versaoNoDispositivoUsuario => _versaoNoDispositivoUsuario;
  set versaoNoDispositivoUsuario(String value) {
    _versaoNoDispositivoUsuario = value;
    prefs.setString('ff_versaoNoDispositivoUsuario', value);
  }

  String _versaoAtualMobile = '';
  String get versaoAtualMobile => _versaoAtualMobile;
  set versaoAtualMobile(String value) {
    _versaoAtualMobile = value;
    prefs.setString('ff_versaoAtualMobile', value);
  }

  String _versaoAtualDesktop = '3.2.5';
  String get versaoAtualDesktop => _versaoAtualDesktop;
  set versaoAtualDesktop(String value) {
    _versaoAtualDesktop = value;
    prefs.setString('ff_versaoAtualDesktop', value);
  }

  String _resetarAtualizacao = '2.0.1';
  String get resetarAtualizacao => _resetarAtualizacao;
  set resetarAtualizacao(String value) {
    _resetarAtualizacao = value;
    prefs.setString('ff_resetarAtualizacao', value);
  }

  List<double> _OrdemAnunciosPlus = [];
  List<double> get OrdemAnunciosPlus => _OrdemAnunciosPlus;
  set OrdemAnunciosPlus(List<double> value) {
    _OrdemAnunciosPlus = value;
    prefs.setStringList(
        'ff_OrdemAnunciosPlus', value.map((x) => x.toString()).toList());
  }

  void addToOrdemAnunciosPlus(double value) {
    OrdemAnunciosPlus.add(value);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  void removeFromOrdemAnunciosPlus(double value) {
    OrdemAnunciosPlus.remove(value);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromOrdemAnunciosPlus(int index) {
    OrdemAnunciosPlus.removeAt(index);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  void updateOrdemAnunciosPlusAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    OrdemAnunciosPlus[index] = updateFn(_OrdemAnunciosPlus[index]);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  void insertAtIndexInOrdemAnunciosPlus(int index, double value) {
    OrdemAnunciosPlus.insert(index, value);
    prefs.setStringList('ff_OrdemAnunciosPlus',
        _OrdemAnunciosPlus.map((x) => x.toString()).toList());
  }

  List<String> _OrdemAnunciosPlusSTRING = [];
  List<String> get OrdemAnunciosPlusSTRING => _OrdemAnunciosPlusSTRING;
  set OrdemAnunciosPlusSTRING(List<String> value) {
    _OrdemAnunciosPlusSTRING = value;
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', value);
  }

  void addToOrdemAnunciosPlusSTRING(String value) {
    OrdemAnunciosPlusSTRING.add(value);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  void removeFromOrdemAnunciosPlusSTRING(String value) {
    OrdemAnunciosPlusSTRING.remove(value);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  void removeAtIndexFromOrdemAnunciosPlusSTRING(int index) {
    OrdemAnunciosPlusSTRING.removeAt(index);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  void updateOrdemAnunciosPlusSTRINGAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    OrdemAnunciosPlusSTRING[index] = updateFn(_OrdemAnunciosPlusSTRING[index]);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  void insertAtIndexInOrdemAnunciosPlusSTRING(int index, String value) {
    OrdemAnunciosPlusSTRING.insert(index, value);
    prefs.setStringList('ff_OrdemAnunciosPlusSTRING', _OrdemAnunciosPlusSTRING);
  }

  int _qntdItensCarrinho = 0;
  int get qntdItensCarrinho => _qntdItensCarrinho;
  set qntdItensCarrinho(int value) {
    _qntdItensCarrinho = value;
    prefs.setInt('ff_qntdItensCarrinho', value);
  }

  List<String> _nomesProdutosCarrinhoUsuer = [];
  List<String> get nomesProdutosCarrinhoUsuer => _nomesProdutosCarrinhoUsuer;
  set nomesProdutosCarrinhoUsuer(List<String> value) {
    _nomesProdutosCarrinhoUsuer = value;
    prefs.setStringList('ff_nomesProdutosCarrinhoUsuer', value);
  }

  void addToNomesProdutosCarrinhoUsuer(String value) {
    nomesProdutosCarrinhoUsuer.add(value);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  void removeFromNomesProdutosCarrinhoUsuer(String value) {
    nomesProdutosCarrinhoUsuer.remove(value);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  void removeAtIndexFromNomesProdutosCarrinhoUsuer(int index) {
    nomesProdutosCarrinhoUsuer.removeAt(index);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  void updateNomesProdutosCarrinhoUsuerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nomesProdutosCarrinhoUsuer[index] =
        updateFn(_nomesProdutosCarrinhoUsuer[index]);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  void insertAtIndexInNomesProdutosCarrinhoUsuer(int index, String value) {
    nomesProdutosCarrinhoUsuer.insert(index, value);
    prefs.setStringList(
        'ff_nomesProdutosCarrinhoUsuer', _nomesProdutosCarrinhoUsuer);
  }

  Color _corSelecionadaAnunciante = Color(4285005984);
  Color get corSelecionadaAnunciante => _corSelecionadaAnunciante;
  set corSelecionadaAnunciante(Color value) {
    _corSelecionadaAnunciante = value;
  }

  String _templeteLayoutSelecionado = '';
  String get templeteLayoutSelecionado => _templeteLayoutSelecionado;
  set templeteLayoutSelecionado(String value) {
    _templeteLayoutSelecionado = value;
  }

  String _valueFormat = '';
  String get valueFormat => _valueFormat;
  set valueFormat(String value) {
    _valueFormat = value;
  }

  double _valueDouble = 0.0;
  double get valueDouble => _valueDouble;
  set valueDouble(double value) {
    _valueDouble = value;
  }

  DocumentReference? _anuncianteSelecionadoEnviarNotificacao;
  DocumentReference? get anuncianteSelecionadoEnviarNotificacao =>
      _anuncianteSelecionadoEnviarNotificacao;
  set anuncianteSelecionadoEnviarNotificacao(DocumentReference? value) {
    _anuncianteSelecionadoEnviarNotificacao = value;
  }

  String _HTMLMessage = '';
  String get HTMLMessage => _HTMLMessage;
  set HTMLMessage(String value) {
    _HTMLMessage = value;
  }

  String _avatarUrl = '';
  String get avatarUrl => _avatarUrl;
  set avatarUrl(String value) {
    _avatarUrl = value;
    prefs.setString('ff_avatarUrl', value);
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
