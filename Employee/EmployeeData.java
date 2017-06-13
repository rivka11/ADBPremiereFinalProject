/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Employee;


import utilityClasses.UtilityClass;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author me
 */
public class EmployeeData extends JFrame {

    Connection dbConnection;
    JButton updateButton;
    JTextField Fnametxt;
    JTextField Lnametxt;
    JTextField phonetxt;
    JTextField streettxt;
    JTextField citytxt;
    JTextField statetxt;
    JTextField ziptxt;
    JComboBox stateCombo;
    String oldFname;
    String oldLname;

    public EmployeeData(String fname, String lname, Connection db)
      {
        if (db == null) {
            System.out.println("error");
        }
        this.oldFname = fname;
        this.oldLname = lname;
        this.setSize(700, 700);
        this.setTitle("Premiere Application");
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        this.setLayout(new GridLayout(5, 2));

        this.dbConnection = db;
        String query;

        query
                = "select FirstName, LastName, street , city , EmpState ,zipCode,"
                + "phoneNumber"
                + " from modifyemployeedata";// where firstname = '" + fname + "' and lastName = '" + lname + "'";

        try {

            Statement q = dbConnection.createStatement();
            ResultSet rs = q.executeQuery(query);
            while (rs.next()) {
                String fnm = rs.getString("FirstName");
                String lName = rs.getString("LastName");
                String street = rs.getString("street");
                String city = rs.getString("city");
                String state = rs.getString("empState");
                String zip = rs.getString("zipCode");
                String phone = rs.getString("phoneNumber");

                this.Fnametxt = new JTextField(fnm);
                this.Fnametxt.setEditable(false);

                this.Lnametxt = new JTextField(lName);
                this.citytxt = new JTextField(city);
                this.phonetxt = new JTextField(phone);
                this.ziptxt = new JTextField(zip);
                this.streettxt = new JTextField(street);

                this.updateButton = new JButton("update");
                this.updateButton.addActionListener(new UpdateListener(this));

                this.stateCombo = new JComboBox();
                stateCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[]{"AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"}));
                this.stateCombo.setSelectedItem(state);

                this.add(this.Fnametxt);
                this.add(this.Lnametxt);
                this.add(this.streettxt);
                this.add(this.citytxt);
                this.add(this.stateCombo);
                this.add(this.ziptxt);
                this.add(this.updateButton);

            }

        } catch (SQLException ex) {
            System.out.println("error from here");
            ex.printStackTrace();
        }

        pack();
        this.setVisible(true);
      }

    private class UpdateListener implements ActionListener {

        JFrame window;

        public UpdateListener(JFrame window)
          {
            this.window = window;
          }

        @Override
        public void actionPerformed(ActionEvent e)
          {
            if (UtilityClass.checkNull() || UtilityClass.checkEmpty(Lnametxt, streettxt, citytxt, phonetxt)) {
                JOptionPane.showMessageDialog(null, "Fields lastname, street, city, and phone may not be blank");
                return;
            }

            //         String query = "UPDATE modifyEmployeeData SET  LastName = '" + Lnametxt.getText()
            //                 + "'  WHERE firstName = '" + oldFname + "' and lastName = '" + oldLname + "'";
            String query = "UPDATE modifyEmployeeData SET lastname = ?, street = ?, city = ?, empstate = ? , zipcode = ?, phonenumber = ? ";

            System.out.println(query);
            try {
                PreparedStatement s = dbConnection.prepareStatement(query);
                s.setString(1, Lnametxt.getText());
                s.setString(2, streettxt.getText());
                s.setString(3, citytxt.getText());
                s.setString(4, (String) stateCombo.getSelectedItem());
                //zip is allowed to be null
                if (ziptxt != null && ziptxt.getText().equals("")) {
                    s.setString(5, null);
                } else {
                    s.setString(5, ziptxt.getText());
                }
                s.setString(6, phonetxt.getText());

                s.executeUpdate();
                dbConnection.commit();
                JOptionPane.showMessageDialog(null, "Update successful!");
                //close this window
                window.dispose();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

          }

    }

}
