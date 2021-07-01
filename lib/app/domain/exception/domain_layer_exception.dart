
import 'dart:html';

class DomainLayerException implements Exception {
  String cause; //causa do exception

  DomainLayerException(this.cause);

  @override
  String toString() {
    return cause;
  }
}