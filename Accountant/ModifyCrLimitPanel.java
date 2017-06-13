/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Accountant;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author me
 */
public class ModifyCrLimitPanel extends JPanel {

    private JComboBox<Integer> customerCombo;
    private Connection dbConnection;
    private JTextField newCustomerCrLimit;
    private JTextField oldCustomerCrLimit;
    private JButton updateCRLimit;
    private JLabel chooseCustomerlbl;
    private JLabel oldCredit;
    private JLabel newCredit;

    public ModifyCrLimitPanel(Connection dbConnection)
      {
        this.oldCredit = new JLabel("current credit");
        this.newCredit = new JLabel("update to: ");
        this.chooseCustomerlbl = new JLabel("Choose customer ");
        this.dbConnection = dbConnection;
        this.oldCustomerCrLimit = new JTextField();
        this.oldCustomerCrLimit.setColumns(10);
        this.newCustomerCrLimit = new JTextField();
        this.newCustomerCrLimit.setColumns(10);
        this.oldCustomerCrLimit.setEditable(false);

        this.customerCombo = new JComboBox<>();
        customerCombo.setModel(new DefaultComboBoxModel(getCustNums()));
        customerCombo.addItemListener(new MyItemListener());

        this.updateCRLimit = new JButton("Update");
        this.updateCRLimit.addActionListener(new UpdateButtonListener());

        this.add(this.chooseCustomerlbl);
        this.add(customerCombo);
        this.add(this.oldCredit);
        this.add(this.oldCustomerCrLimit);

        this.add(this.newCredit);

        this.add(this.newCustomerCrLimit);

        this.add(this.updateCRLimit);
        this.setVisible(true);
      }

    private Integer[] getCustNums()
      {
        ArrayList<Integer> nums = new ArrayList<>();
        Integer[] numsReturn = null;//= (Integer[]) nums.toArray();

        try {
            String query = "select cust_num from allCustomerDataView";
            Statement s = dbConnection.createStatement();
            ResultSet rs = s.executeQuery(query);

            while (rs.next()) {
                nums.add(rs.getInt("cust_Num"));
            }

            numsReturn = new Integer[nums.size()];

            for (int i = 0; i < numsReturn.length; i++) {
                numsReturn[i] = nums.get(i);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return numsReturn;
      }

    private class MyItemListener implements ItemListener {

        @Override
        public void itemStateChanged(ItemEvent e)
          {
            try {
                String query = "select credit_limit from allCustomerDataView where cust_num =?";
                PreparedStatement s = dbConnection.prepareStatement(query);
                s.setInt(1, Integer.valueOf(customerCombo.getSelectedItem().toString()));
                ResultSet rs = s.executeQuery();

                while (rs.next()) {
                    oldCustomerCrLimit.setText(String.valueOf(rs.getDouble("credit_limit")));
                    break;
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

          }

    }

    private class UpdateButtonListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {
            try {
                Double num = Double.parseDouble(newCustomerCrLimit.getText());
                PreparedStatement st = dbConnection.prepareStatement("update allcustomerdataview set credit_limit = ? where cust_num = ?");

                st.setDouble(1, num);
                st.setInt(2, Integer.valueOf(customerCombo.getSelectedItem().toString()));

                st.executeUpdate();
                dbConnection.commit();
                JOptionPane.showMessageDialog(null, "Update successful");

            } catch (NumberFormatException o) {
                JOptionPane.showMessageDialog(null, "Invalid credit limit");
                return;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
          }

    }

}
