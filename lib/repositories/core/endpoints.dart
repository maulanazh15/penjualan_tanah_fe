class Endpoints {
  // Base Url

  static const base = "http://10.0.2.2";
  static const baseUrl = "$base:8000";
  // 'https://47f4-182-2-45-233.ngrok-free.app';
  static const broadCastUrl = "http://10.0.2.2:6001";

  /// Current Api Version
  static const _apiVersion = "/api";

  /// Auth
  static const _baseAuth = "$_apiVersion/user";

  static const register = "$_baseAuth/register";
  static const login = "$_baseAuth/login";
  static const currentUser = "$_baseAuth/current-user";
  static const logout = "$_baseAuth/logout";

  /// Chat
  static const _baseChat = "$_apiVersion/chat";

  static const getChats = _baseChat;
  static const getSingleChat = "$_baseChat/";
  static const createChat = _baseChat;

  /// Chat message
  static const _baseChatMessage = "$_apiVersion/chat_message";

  static const getChatMessages = _baseChatMessage;
  static const createChatMessage = _baseChatMessage;

  /// User

  static const getUsers = "$_apiVersion/user";
  static const getPhotoProfile = "$baseUrl$_baseAuth/photo-profile";
  static const updateUserProfile = "$_baseAuth/update";

  // Location
  static const baseLocation = "$_apiVersion/location";
  static const getProvinces = "$baseLocation/provinces";
}
