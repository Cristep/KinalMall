
package org.cristiancumez.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.Initializable;
import org.cristiancumez.system.Principal;

/**
 * @author Cristian Noe Cumez Morales
 * Codigo técnico:IN5BM
 * @date 6/05/2021
 * @time 07:55:02
 */

public class AutorController implements Initializable{
    
    private Principal escenarioPrincipal;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
      
    }

    public Principal getEscenarioPrincipal() {
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Principal escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
    }

}
