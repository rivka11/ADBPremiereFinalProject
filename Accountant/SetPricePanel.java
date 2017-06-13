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
 * @author Rivka Schuster
 */
public class SetPricePanel extends JPanel {

    private Connection dbConnection;
    private JLabel currentPrice;
    private JLabel updatePricelbl;
    private JTextField currentPricetxt;
    private JTextField newPricetxt;
    private JComboBox<String> partNumCombo;
    private JButton updatePrice;

    public SetPricePanel(Connection dbConnection)
      {
        this.dbConnection = dbConnection;

        this.partNumCombo = new JComboBox<>();
        partNumCombo.setModel(new DefaultComboBoxModel(getPartNums()));
        partNumCombo.addItemListener(new MyItemListener());

        this.add(this.partNumCombo);
        this.currentPrice = new JLabel("current Price");
        this.currentPricetxt = new JTextField();
        this.currentPricetxt.setEditable(false);
        this.currentPricetxt.setColumns(10);

        this.updatePricelbl = new JLabel("update Price to: ");
        this.newPricetxt = new JTextField();
        this.newPricetxt.setColumns(10);

        this.updatePrice = new JButton("update price");
        this.updatePrice.addActionListener(new UpdateListener());

        this.add(this.currentPrice);
        this.add(this.currentPricetxt);

        this.add(this.updatePricelbl);
        this.add(this.newPricetxt);
        this.add(this.updatePrice);

      }

    private class UpdateListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {
            try {
                PreparedStatement st = dbConnection.prepareStatement("update updatepartprice set price = ? where part_num = ?");
                st.setDouble(1, Double.parseDouble(newPricetxt.getText()));
                st.setString(2, partNumCombo.getSelectedItem().toString());

                st.execute();
                dbConnection.commit();
                JOptionPane.showMessageDialog(null, "Price updated");
            } catch (NumberFormatException o) {
                JOptionPane.showMessageDialog(null, "Invalid number.");
                return;
            } catch (SQLException ex) {
                try {
                    dbConnection.rollback();
                } catch (SQLException ex1) {
                    ex1.printStackTrace();
                }
                ex.printStackTrace();
            }

          }
    }

    private String[] getPartNums()
      {
        ArrayList<String> nums = new ArrayList<>();
        String[] numsReturn = null;//= (Integer[]) nums.toArray();

        try {
            String query = "select part_num from updatePartPrice";
            Statement s = dbConnection.createStatement();
            ResultSet rs = s.executeQuery(query);

            while (rs.next()) {
                nums.add(rs.getString("part_Num"));
            }

            numsReturn = new String[nums.size()];

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
                String query = "select price from updatePartPrice where part_num =?";
                PreparedStatement s = dbConnection.prepareStatement(query);
                s.setString(1, partNumCombo.getSelectedItem().toString());
                ResultSet rs = s.executeQuery();

                while (rs.next()) {
                    currentPricetxt.setText(String.valueOf(rs.getDouble("price")));
                    break;
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

          }
    }

}
