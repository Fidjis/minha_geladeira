import 'package:mobx/mobx.dart';

part 'principal_store.g.dart';

class PrincipalSt extends PrincipalStBase with _$PrincipalSt {
  static PrincipalSt _instance;
  factory PrincipalSt() {
    _instance ??= PrincipalSt._internalConstructor();
    return _instance;
  }
  PrincipalSt._internalConstructor();
}

abstract class PrincipalStBase with Store {
  
    @observable
    bool geladeiraAberta = false;

    @action
    abrirGeladeira() {
        geladeiraAberta = true;
    }

    @action
    fecharGeladeira() {
        geladeiraAberta = false;
    }
}