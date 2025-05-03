// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get close => 'Fechar';

  @override
  String get open => 'Abrir';

  @override
  String get proceed => 'Prosseguir';

  @override
  String get share => 'Compartilhar';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get loading => 'Loading';

  @override
  String get copy => 'Copiar';

  @override
  String get copied => 'Copiado';

  @override
  String get delete => 'Excluir';

  @override
  String get deleteItem => 'Excluir item';

  @override
  String get deleteItemConfirm => 'Tem certeza de que deseja excluir este item?';

  @override
  String get confirm => 'Confirmar';

  @override
  String get next => 'Próximo';

  @override
  String get pickFromGallery => 'Escolher da galeria';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Escuro';

  @override
  String get low => 'Baixo';

  @override
  String get medium => 'Médio';

  @override
  String get high => 'Alto';

  @override
  String get app => 'Aplicativo';

  @override
  String get today => 'Hoje';

  @override
  String get yesterday => 'Ontem';

  @override
  String itemCount(Object count) {
    return '$count itens';
  }

  @override
  String get deleteAllItems => 'Excluir todos os itens';

  @override
  String get deleteAllItemsWarning => 'Tem certeza de que deseja excluir todos os itens?';

  @override
  String get home => 'Início';

  @override
  String get history => 'Histórico';

  @override
  String get noHistory => 'Sem histórico';

  @override
  String get settings => 'Configurações';

  @override
  String get scanQRCodeTitle => 'Escanear QR Code';

  @override
  String get scanQRCodeSubtitle => 'Use a câmera do dispositivo para escanear um QR Code.';

  @override
  String get scanImageTitle => 'Escanear imagem';

  @override
  String get scanImageSubtitle => 'Procurar códigos QR em uma imagem.';

  @override
  String get qrGeneratorTitle => 'Gerador de QR';

  @override
  String get qrGeneratorSubtitle => 'Crie seu próprio código QR.';

  @override
  String get text => 'Texto';

  @override
  String get mail => 'Email';

  @override
  String get to => 'Para';

  @override
  String get subject => 'Assunto';

  @override
  String get body => 'Corpo';

  @override
  String get url => 'URL';

  @override
  String get urlError => 'Digite uma URL válida.';

  @override
  String get phone => 'Telefone';

  @override
  String get message => 'Mensagem';

  @override
  String get sms => 'SMS';

  @override
  String get qrEditor => 'Editor de QR';

  @override
  String get bgColorTitle => 'Cor de fundo';

  @override
  String get bgColorSubtitle => 'Escolha uma cor que contraste com o padrão para garantir boa leitura.';

  @override
  String get patternColorTitle => 'Cor do padrão';

  @override
  String get patternColorSubtitle => 'Escolha uma cor para o padrão (pontos). Use uma cor escura para melhor leitura.';

  @override
  String get eyeColorTitle => 'Cor dos olhos';

  @override
  String get eyeColorSubtitle => 'Escolha uma cor para os olhos (cantos do QR).';

  @override
  String get addLogoTitle => 'Adicionar logo';

  @override
  String get addLogoSubtitle => 'Adicione seu logotipo personalizado ao centro do QR.';

  @override
  String get addLogoWarning => 'Adicionar um logotipo pode causar problemas na leitura do código.';

  @override
  String get addLogoInvalidError => 'Selecione um logotipo válido.';

  @override
  String get logoSizeTitle => 'Tamanho do logo';

  @override
  String get logoSizeSubtitle => 'Escolha um tamanho para o logotipo.';

  @override
  String get exportSizeTitle => 'Tamanho da exportação';

  @override
  String get exportSizeSubtitle => 'Um tamanho maior garante melhor qualidade.';

  @override
  String get enableGapTitle => 'Ativar espaçamento';

  @override
  String get enableGapSubtitle => 'Permite espaçamento entre os pontos do padrão.';

  @override
  String get patternShape => 'Forma do padrão';

  @override
  String get eyeShape => 'Forma dos olhos';

  @override
  String get square => 'Quadrado';

  @override
  String get circle => 'Círculo';

  @override
  String get saveQR => 'Salvar QR';

  @override
  String get shareQR => 'Compartilhar QR';

  @override
  String get qrSaved => 'QR salvo';

  @override
  String get imageNotExists => 'A imagem não existe.';

  @override
  String get imagePickFailed => 'Falha ao selecionar imagem';

  @override
  String get noQRFound => 'Nenhum QR encontrado.';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSubtitle => 'Modo do tema';

  @override
  String get contrastTitle => 'Contraste';

  @override
  String get contrastSubtitle => 'Contraste do tema';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSubtitle => 'Escolha seu idioma preferido';

  @override
  String get data => 'Dados';

  @override
  String get backupDataTitle => 'Backup de dados';

  @override
  String get backupDataSubtitle => 'Crie um arquivo de backup no seu dispositivo.';

  @override
  String get restoreDataTitle => 'Restaurar dados';

  @override
  String get restoreDataSubtitle => 'Restaure um backup do seu dispositivo.';

  @override
  String get restoreDataWarning => 'Este processo substituirá os dados existentes. Deseja continuar?';

  @override
  String get backupSuccess => 'Backup realizado com sucesso';

  @override
  String get backupFailed => 'Falha no backup';

  @override
  String get restoreSuccess => 'Restauração concluída';

  @override
  String get restoreFailed => 'Falha na restauração';

  @override
  String get backupInvalidFile => 'Selecione um arquivo de backup válido com extensão .db.';

  @override
  String get deleteDataTitle => 'Excluir dados';

  @override
  String get deleteDataSubtitle => 'Exclua todos os dados escaneados.';

  @override
  String get deleteDataWarning => 'Todo o histórico será apagado do banco de dados. Esta ação é irreversível.';

  @override
  String get about => 'Sobre';

  @override
  String get privacyPolicyTitle => 'Política de Privacidade';

  @override
  String get privacyPolicySubtitle => 'Clique aqui para ler nossa política de privacidade.';

  @override
  String get licensesTitle => 'Licenças';

  @override
  String get licensesSubtitle => 'Clique aqui para ver as licenças.';

  @override
  String get reportBugTitle => 'Reportar erro';

  @override
  String get reportBugSubtitle => 'Reportar um erro no GitHub.';

  @override
  String get reportBugDialogHeading => 'Reportar erro';

  @override
  String get reportBugDialogTitle => 'Deseja reportar um erro?';

  @override
  String get reportBugDialogSubtitle => 'A página de Issues do GitHub será aberta para que você descreva o problema.';

  @override
  String get cameraPermissionRequiredTitle => 'Permissão da câmera necessária';

  @override
  String get cameraPermissionRequiredSubtitle => 'É necessário permitir o uso da câmera para escanear QR Codes.';

  @override
  String get cameraPermissionDeniedTitle => 'Permissão da câmera negada permanentemente';

  @override
  String get cameraPermissionDeniedSubtitle => 'Você deve permitir o uso da câmera nas configurações do aplicativo para escanear QR Codes.';

  @override
  String get openSettings => 'Abrir configurações';

  @override
  String get openSettingsError => 'Não foi possível abrir as configurações. Por favor, abra manualmente.';

  @override
  String get allowPermission => 'Permitir permissão';
}
