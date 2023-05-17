

class ApiUrl
{
 static const String baseUrl='http://139.59.35.127/';
 static  String  getCompanyDataUrl({int page=1})=>'${baseUrl}apex-dmit/public/api/company?page=$page';
 static const String addCompanyUrl='${baseUrl}apex-dmit/public/api/company';


}

