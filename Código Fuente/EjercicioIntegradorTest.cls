@isTest
public class EjercicioIntegradorTest {
	@isTest static void obtenerEmailsPorIdsTest(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('usuarioProContacto');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        List<String> idProcontacto = new List<String>();
        idProcontacto.add('-Ok62XXuiJVi-aMU7pb_');
        Map<String,String> test = EjercicioIntegrador.obtenerEmailsPorIds(idProcontacto);
        Assert.areEqual('luis.hernandez@procontacto.com.mx', test.get('-Ok62XXuiJVi-aMU7pb_'));
    }
    
    @isTest static void notFound(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('usuarioProContacto');
        mock.setStatusCode(404);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);        
        List<String> idProcontacto = new List<String>();
        idProcontacto.add('-Ok62XXuiJVi-aMU7pbaassd_');
        Map<String,String> test = EjercicioIntegrador.obtenerEmailsPorIds(idProcontacto);
        Assert.areEqual(null, test.get('-Ok62XXuiJVi-aMU7pbaassd_'));
    }
}