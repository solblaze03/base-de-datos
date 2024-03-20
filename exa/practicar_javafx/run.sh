#!/bin/bash
javac --module-path lib/ --add-modules javafx.controls,javafx.fxml  Psql.java;
javac --module-path lib/ --add-modules javafx.controls,javafx.fxml  Controller.java;
java --module-path lib/ --add-modules javafx.controls,javafx.fxml -cp lib/mysql-connector-j-8.3.0.jar:./ Psql.java
  
  
