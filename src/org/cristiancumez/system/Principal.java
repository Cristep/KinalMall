
package org.cristiancumez.system;

import java.io.IOException;
import java.io.InputStream;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.cristiancumez.controller.AutorController;
import org.cristiancumez.controller.MenuPrincipalController;

/**
 * @author Cristian Noe Cumez Morales
 * Codigo técnico:IN5BM
 * @date 6/05/2021
 * @time 07:55:02
 */

public class Principal extends Application {

    private final String PAQUETE_VIEW = "/org/cristiancumez/view/";
    private final String PAQUETE_IMAGES = "/org/cristiancumez/resource/images/";
    private Stage escenarioPrincipal;
    private Scene escena;
    
    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
        this.escenarioPrincipal = stage;
        menuPrincipal();
      
         
        
        
    }
     
    public void menuPrincipal() {
        try {
            System.out.println("Hola mundo 2");
            MenuPrincipalController menuPrincipal = null;
            menuPrincipal = (MenuPrincipalController) cambiarEscena("MenuPrincipalView.fxml", 667, 395);
            menuPrincipal.setEscenarioPrincipal(this);
        } catch (Exception ex) {
            System.out.println("Se produjo un error al cargar la vista del menú principal");
            ex.printStackTrace();
        }
    }
    
    public void mostrarEscenaAutor() {
        try {
            System.out.println("Hola mundo");
            AutorController autorController = (AutorController) cambiarEscena("AutorView.fxml", 600, 302);
            autorController.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println("Se produjo un error al cargar la vista del autor");
            e.printStackTrace();
        }

    }
    
    public Initializable cambiarEscena(String viewFxml, int ancho, int alto) throws Exception {
        Initializable resultado = null;    
        
        FXMLLoader cargadorFXML = new FXMLLoader();   
        InputStream archivo = Principal.class.getResourceAsStream(PAQUETE_VIEW + viewFxml);
        cargadorFXML.setBuilderFactory(new JavaFXBuilderFactory());
        cargadorFXML.setLocation(Principal.class.getResource(PAQUETE_VIEW + viewFxml));
        escena = new Scene((AnchorPane) cargadorFXML.load(archivo), ancho, alto);
        escenarioPrincipal.setScene(escena);
        escenarioPrincipal.sizeToScene();
        escenarioPrincipal.setResizable(false);
        escenarioPrincipal.setTitle("Kinal Mall - Cristian Cumez");  
        escenarioPrincipal.show();
        
        resultado = (Initializable) cargadorFXML.getController(); 
        return resultado;
    }
}
