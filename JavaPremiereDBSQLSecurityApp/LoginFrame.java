package JavaPremiereDBSQLSecurityApp;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class LoginFrame extends JFrame {

    private JTextField loginField;
    private JPasswordField passwordField;
    private final JPanel loginPanel;
    private final JButton loginButton;
    private final JButton cancelButton;
    private Connection dbConnection;
    private final JButton loginAsGuestButton;

    public LoginFrame()
      {
        this.setSize(500, 150);
        this.setTitle("Premiere Application Login");
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        this.setPreferredSize(getSize());

        //set up the login panel
        loginPanel = setUpPanel();
        this.setLayout(new FlowLayout());
        //add the login panel to the window
        this.add(loginPanel, BorderLayout.CENTER);

        //set up the command buttons
        loginButton = new JButton("LOGIN");
        cancelButton = new JButton("CANCEL");
        loginAsGuestButton = new JButton("Login as a guest user");

        loginButton.addActionListener(new LoginListener(this));

        cancelButton.addActionListener(new CancelListener(this));
        loginAsGuestButton.addActionListener(new LoginListener(this));

        this.add(loginButton);
        this.add(cancelButton);
        this.add(loginAsGuestButton);

        this.pack();
        this.setVisible(true);

      }

    private JPanel setUpPanel()
      {
        JPanel loginPanel = new JPanel();
        loginPanel.setLayout(new GridLayout(2, 2));
        loginPanel.add(new JLabel("SQL Login:"));
        loginField = new JTextField(20);
        loginPanel.add(loginField);
        loginPanel.add(new JLabel("Password:"));
        passwordField = new JPasswordField();
        loginPanel.add(passwordField);
        return loginPanel;

      }

    private class LoginListener implements ActionListener {

        private JFrame parentWindow;

        public LoginListener(JFrame parentWindow)
          {
            this.parentWindow = parentWindow;
          }

        @Override
        public void actionPerformed(ActionEvent e)
          {
            String login;
            char[] code;
            JButton clicked = (JButton) e.getSource();
//TODO can multiple users be logged in as one user?! CRITICAL QUESTION!
            if (clicked.getText().equals("Login as a guest user")) {
                login = "guest";
                code = new char[]{'a', 'b', 'c'};
            } else {
                //retrieve data that user entered on the screen
                login = loginField.getText();
                //this statement is a security vulnerability
                code = passwordField.getPassword();
            }
            connectToDatabase(login, code);
            this.parentWindow.dispose();

          }

        private void connectToDatabase(String login, char[] code)
          {

            String password = new String(code);

            //testing this by connecting to sql server using SQL Server Authentication on the local machine
            final String DATABASE_URL = "jdbc:sqlserver://192.168.1.4:62372;"
                    + "databaseName=Premiere";

            try {

                //establish connection to database
                //for computer SQL Server 2008
                System.out.println("connecting to database");
                //for sql server authentication
                dbConnection = DriverManager.getConnection(DATABASE_URL, login, password);

                //for windows authentication
                //dbConnection =DriverManager.getConnection(DATABASE_URL);
                //to enable transaction processing do not
                //automatically commit
                dbConnection.setAutoCommit(false);

                //now that we connected to SQL Server and the database, display the main menu window
                new MainMenuFrame(dbConnection);
            } catch (SQLException sqlException) {
                JOptionPane.showMessageDialog(null, "couldn't connect to premiere database ");
                sqlException.printStackTrace();

            }
          }
    }   //end LoginListener class

    private class CancelListener implements ActionListener {

        private JFrame parentWindow;

        public CancelListener(JFrame parentWindow)
          {
            this.parentWindow = parentWindow;

          }

        @Override
        public void actionPerformed(ActionEvent e)
          {

            //close the login window
            JOptionPane.showMessageDialog(null, "login cancelled");
            parentWindow.dispose();

          }

    }

    public static void main(String[] args)
      {
        try {
            new LoginFrame();
        } catch (Exception o) {
            JOptionPane.showMessageDialog(null, "There was a serious error and the program has to close. Please contact Rivka Schuster @rsursmile@gmail.com");
            System.exit(1);
        }
      }
}  //end LoginInFrame class

