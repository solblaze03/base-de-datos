import java.sql.*;
import java.util.Scanner;

public class rs {

    public static void clearTerminal() {
        try {
            String os = System.getProperty("os.name").toLowerCase();

            if (os.contains("win")) {
                
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            } else {
                
                new ProcessBuilder("clear").inheritIO().start().waitFor();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_RESET = "\u001B[0m";

    public static void main(String[] args) {
        try {
            clearTerminal();
            Scanner sc = new Scanner(System.in);
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:33006/examen_ev2", "root", "2003");
            Statement st =  con.createStatement();
            ResultSet rs = st.executeQuery("select * from PREGUNTA");
            ResultSet rsr = null;
            String sql = ("Select * from RESPUESTA where idRespuesta like ? ");
            String upd = ("UPDATE PREGUNTA SET idRespuesta = ? WHERE idPregunta = ?");
            PreparedStatement ps = con.prepareStatement(sql);
            PreparedStatement ps1 = con.prepareStatement(upd);
            int cont = 1;
            while (rs.next()) {
                String idpregunta = rs.getString("IdPregunta");
                String enunciado = rs.getString("Enunciado");
                System.out.println(ANSI_GREEN+idpregunta+" "+enunciado+ANSI_RESET);
                System.out.println("Elige la respuesta: ");
                String res = cont+".%";
                
                ps.setString(1, res);
                rsr = ps.executeQuery();
                
               
                while (rsr.next()) {
                    String idrespue = rsr.getString("IdRespuesta");
                    String respues = rsr.getString("Respuesta");
                    System.out.println(ANSI_BLUE+idrespue + " " + respues+ANSI_RESET);
                }
                
                String respuesta = sc.nextLine();
                ps1.setString(1, respuesta);
                
                ps1.setInt(2, cont);
                ps1.executeUpdate();
                clearTerminal();
                cont++;
                if(cont == 12 ){
                    break;
                }
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}