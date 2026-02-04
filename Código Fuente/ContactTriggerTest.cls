@isTest
public class ContactTriggerTest {
	@isTest static void testinsertar(){
        Contact con = new Contact(FirstName = 'Luis', LastName = 'Hernandez', idprocontacto__C = '-Ok62XXuiJVi-aMU7pb_');
        Test.startTest();
        insert con;
        Test.stopTest();
        Contact conVeri = [SELECT Email, idprocontacto__c FROM Contact WHERE idprocontacto__c = '-Ok62XXuiJVi-aMU7pb_'];
        Assert.areEqual('luis.hernandez@procontacto.com.mx',conVeri.Email);
    }
    
    @isTest static void testactualizar(){
        Contact con = new Contact(FirstName = 'Luis', LastName = 'Hernandez');
        insert con;
        Contact conupdate = [SELECT Id, idprocontacto__c FROM Contact WHERE Id =:con.Id];
        conupdate.idprocontacto__c = '-Ok62XXuiJVi-aMU7pb_';
        Test.startTest();
        update conupdate;
        Test.stopTest();
        Contact conVeri = [SELECT Email, idprocontacto__c FROM Contact WHERE idprocontacto__c = '-Ok62XXuiJVi-aMU7pb_'];
        Assert.areEqual('luis.hernandez@procontacto.com.mx',conVeri.Email);
    }

    @isTest static void triggerDesactivadotest(){
        estadoDetrigger.desactivar();
        Contact con = new Contact(FirstName = 'Luis', LastName = 'Hernandez');
        Test.startTest();
        estadoDetrigger.desactivar();
        insert con;
        Test.stopTest();    
        estadoDetrigger.activar();
    }
}