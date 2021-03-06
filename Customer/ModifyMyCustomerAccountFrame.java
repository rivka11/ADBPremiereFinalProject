/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer;

/**
 *
 * @author me
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author me
 */
public class ModifyMyCustomerAccountFrame extends JFrame {

    Connection dbConnection;
    JButton updateButton;
   
    JTextField nametxt;
    JTextField phonetxt;
    JTextField streettxt;
    JTextField citytxt;
    JTextField statetxt;
    JTextField ziptxt;
    JComboBox stateCombo;
  

    public ModifyMyCustomerAccountFrame(Connection db)
      {
        if (db == null) {
            System.out.println("error");
        }

        this.setSize(700, 700);
        this.setTitle("My account");
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        this.setLayout(new GridLayout(5, 2));
     
        this.dbConnection = db;
        String query;

        //TODO change to prepared statement
        query
                = "select *"
                + " from modifycustomerdataview";

        try {

            Statement q = dbConnection.createStatement();
            ResultSet rs = q.executeQuery(query);
            while (rs.next()) {
                String fnm = rs.getString("cust_Name");
               
                String street = rs.getString("cust_street");
                String city = rs.getString("cust_city");
             String state = rs.getString("cust_State");
              String zip = rs.getString("cust_zip");
                String phone = rs.getString("phone");

            

                this.nametxt = new JTextField(fnm);
                this.citytxt = new JTextField(city);
                this.phonetxt = new JTextField(phone);
                this.ziptxt = new JTextField(zip);
                this.streettxt = new JTextField(street);

                this.updateButton = new JButton("update");
                this.updateButton.addActionListener(new UpdateListener(this));

                this.stateCombo = new JComboBox();
                stateCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[]{"AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"}));
                this.stateCombo.setSelectedItem(state);

                this.add(this.nametxt);
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

            String query = "UPDATE modifycustomerdataview SET cust_name = ?, cust_street = ?, cust_city = ?, cust_state = ? , cust_zip = ?, phone = ? ";

            System.out.println(query);
            try {
                PreparedStatement s = dbConnection.prepareStatement(query);
                s.setString(1, nametxt.getText());
                s.setString(2, streettxt.getText());
                s.setString(3, citytxt.getText());
                s.setString(4, (String) stateCombo.getSelectedItem());
                s.setString(5, ziptxt.getText());
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
