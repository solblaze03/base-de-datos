import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;

public class Psql extends Application {
    
    @Override
    public void start(Stage stage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("interfaz.fxml"));

        Scene scene = new Scene(root);
       scene.getStylesheets().add(getClass().getResource("Style.css").toExternalForm());
        stage.setScene(scene);
        stage.getIcons().add(new Image("file:db.png"));
        
        
        stage.show();
        

    }

    public static void main(String[] args) {
        launch(args);
    }
    
}
