public class EjercicioIntegrador {
	public static Map<String,String> obtenerEmailsPorIds(List<String> idsProContacto){
        Map<String,String> emails = new Map<String,String>();
        Http http = new Http();
        for(String idProContacto : idsProContacto){
        	HttpRequest request = new HttpRequest();
        	request.setEndpoint('https://procontacto-reclutamiento-default-rtdb.firebaseio.com/contacts/'+ idProContacto +'.json');
        	request.setMethod('GET');
        	HttpResponse response = http.send(request);
        	if(response.getStatusCode() == 200){
            	Map<String,Object> user = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
				String email = (String)user.get('email');
                System.debug(email);
                emails.put(idProContacto, email);
        	}else{
            	emails.put(idProContacto, null);
        	}
        }
        return emails;
    }
}