class DefinicaoApp {
  final bool permiteNotificacao;

  DefinicaoApp({
    this.permiteNotificacao,
  });
  
  String getApiBase() {
    return 'http://uxlab.eastus.cloudapp.azure.com/';
  }
}
