public class estadoDetrigger {
	static boolean estado = true;
    
    public static boolean getEstado(){
        return estado;
    }
    
    public static void desactivar(){
        estado = false;
    }
    
    public static void activar(){
        estado = true;
    }
}