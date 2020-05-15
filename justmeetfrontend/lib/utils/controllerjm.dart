
/// Responsabilità: "Comunicare con il BackEnd.""

class ControllerJM 
{
    String _urlBase = "https://springboot-restapi.herokuapp.com";
    Map<String, String> _headers = {"Accept" : "application/json"};
    String _urlLocal = "http://localhost:9898";

    String getUrlLocal(){return _urlLocal;}
    String getUrlBase(){return _urlBase;}
    void setUrlBase(String newUrl){this._urlBase = newUrl;}
    Map<String, String> getHeaders(){return _headers;}
    void setHeaders(Map<String, String> newHeaders){this._headers = newHeaders;}

}