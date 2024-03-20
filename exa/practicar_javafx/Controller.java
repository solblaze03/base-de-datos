import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.Toggle;
import javafx.scene.control.ToggleGroup;

public class Controller {

    public static int cont=1;

    public void registro() {
        inicio.setText("Siguiente");

        try {
            if(cont <=12) {
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examen_ev2", "root", "2003");
                ResultSet pregunta=null;
                String num=cont+".%";

                String sqlpregunta=("Select * from PREGUNTA where idPregunta like ?");

                ResultSet rsr=null;
                String sql=("Select * from RESPUESTA where idRespuesta like ? ");
                
                PreparedStatement ps=con.prepareStatement(sql);
                

                PreparedStatement pr=con.prepareStatement(sqlpregunta);


                pr.setString(1, String.valueOf(cont));
                pregunta=pr.executeQuery();

                if(pregunta.next()) {
                    Pregunta.setText(pregunta.getString("idPregunta")+". "+pregunta.getString("Enunciado"));
                    ps.setString(1, cont+".%");
                    rsr=ps.executeQuery();
                    int contP=1;

                    while (rsr.next()) {
                        switch (contP) {
                            case 1: Ra.setText(rsr.getString("idRespuesta")+" - "+rsr.getString("Respuesta"));
                            break;
                            case 2: Rb.setText(rsr.getString("idRespuesta")+" - "+rsr.getString("Respuesta"));
                            break;
                            case 3: Rc.setText(rsr.getString("idRespuesta")+" - "+rsr.getString("Respuesta"));
                            break;
                            case 4: Rd.setText(rsr.getString("idRespuesta")+" - "+rsr.getString("Respuesta"));
                            break;
                        }
                        contP++;

                    }
                    
                }
               


                
            }

            else {
                Pregunta.setText("Has terminado todas las preguntas");
            }
        }

        catch (Exception e) {
            System.out.println(e.getMessage());
            //e.printStackTrace();
        }

    }

    @FXML private Button inicio;


    @FXML private Label Pregunta;

    @FXML private RadioButton Ra;

    @FXML private RadioButton Rb;

    @FXML private RadioButton Rc;

    @FXML private RadioButton Rd;

    @FXML private ToggleGroup resp;

    @FXML void boton(ActionEvent event) {

        registro();
        elec.setStyle("visibility:visible");
        inicio.setStyle("visibility:hidden");
        Ra.setStyle("visibility:visible");
        Rb.setStyle("visibility:visible");
        Rc.setStyle("visibility:visible");
        Rd.setStyle("visibility:visible");


    }

    @FXML void elec(ActionEvent event) {
        elecciones();
        registro();
        
    }

    @FXML private Button elec;
    public void elecciones(){
        try {
           
    

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examen_ev2", "root", "2003");

        String upd=("UPDATE PREGUNTA SET idRespuesta = ? WHERE idPregunta = ?");
        PreparedStatement ps1=con.prepareStatement(upd);

        


            ps1.setInt(2, cont);
            if(Ra.isSelected()){
                ps1.setString(1, cont+".a");
                Ra.setSelected(false);
            }else if(Rb.isSelected()){
                ps1.setString(1, cont+".b");
                Rb.setSelected(false);
            }else if(Rc.isSelected()){
                ps1.setString(1, cont+".c");
                Rc.setSelected(false);
            }else if(Rd.isSelected()){
                ps1.setString(1, cont+".d");
                Rd.setSelected(false);
            }
            ps1.executeUpdate();
            cont++;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    

}