/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Buyer;

import Accountant.ModifyCrLimitPanel;
import utilityClasses.UtilityClass;
import java.awt.GridLayout;
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
public class AddPartPanel extends JPanel {

    private Connection dbConnection;
    private JLabel partnumLabel;

    private JTextField partnumtxt;
    private JTextField partdesctxt;
    private JTextField pricetxt;

    private JLabel partdesclbl;
    private JLabel pricelbl;
    private JLabel warehouselbl;
    private JLabel categorylbl;
    private JComboBox<Integer> warehouseCombo;
    private JComboBox<String> categoryCombo;

    private JButton addPart;

    public AddPartPanel(Connection dbConnection)
      {
        this.addPart = new JButton("Add Part");
        this.addPart.addActionListener(new AddPartListener());

        this.dbConnection = dbConnection;
        this.setLayout(new GridLayout(6, 2));

        categoryCombo = new JComboBox<>();
        categoryCombo.setModel(new DefaultComboBoxModel(getListCategory()));
//        categoryCombo.addItemListener(new MyItemCategoryListener());

        warehouseCombo = new JComboBox<>();
        warehouseCombo.setModel(new DefaultComboBoxModel(getWarehouses()));
//        warehouseCombo.addItemListener(new MyItemWarehouseListener());
        this.partnumLabel = new JLabel("part Num");
        this.categorylbl = new JLabel("Category");
        this.partdesclbl = new JLabel("Part description");
        this.pricelbl = new JLabel("Price");
        this.warehouselbl = new JLabel("Warehouse");
        this.partdesctxt = new JTextField();
        this.partdesctxt.setColumns(30);

        this.pricetxt = new JTextField();
        this.pricetxt.setColumns(10);

        this.partnumtxt = new JTextField();
        this.partnumtxt.setColumns(10);

        this.add(this.partnumLabel);
        this.add(this.partnumtxt);

        this.add(this.partdesclbl);
        this.add(this.partdesctxt);

        this.add(this.pricelbl);
        this.add(this.pricetxt);

        this.add(this.warehouselbl);
        this.add(this.warehouseCombo);

        this.add(this.categorylbl);
        this.add(this.categoryCombo);

        this.add(this.addPart);

        this.validate();
        this.setVisible(true);

      }

    /**
     *
     * @return
     */
    private Object[] getWarehouses()
      {
        ArrayList<Integer> cats = new ArrayList<>();
        String query = "select distinct warehouseID from partView";
        try (Statement s = dbConnection.createStatement()) {

            try (ResultSet rs = s.executeQuery(query)) {

                while (rs.next()) {
                    cats.add(rs.getInt("warehouseID"));
                }
//TODO if a warehouse has no parts it will NOT show up on list of parts!! need warehouse table permission
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return cats.toArray();
      }

    private Object[] getListCategory()
      {
        ArrayList<String> cats = new ArrayList<>();
        String query = "select distinct category from partView";

        try (Statement s = dbConnection.createStatement()) {
            try (ResultSet rs = s.executeQuery(query)) {
                while (rs.next()) {
                    cats.add(rs.getString("category"));
                }

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return cats.toArray();
      }

    private class AddPartListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {

            try (PreparedStatement p = dbConnection.prepareStatement("Insert into partView(part_num, part_Description, price, warehouseID, category) values(?, ?, ?, ?, ?)")) {

                p.setString(1, partnumtxt.getText());
                p.setString(2, partdesctxt.getText());
                p.setDouble(3, Double.parseDouble(pricetxt.getText()));
                p.setInt(4, Integer.parseInt(warehouseCombo.getSelectedItem().toString()));
                p.setString(5, categoryCombo.getSelectedItem().toString());

                p.execute();

                dbConnection.commit();
                JOptionPane.showMessageDialog(null, "Part added");
                UtilityClass.emptyAllFields(partnumtxt, partdesctxt, pricetxt);

            } catch (NumberFormatException op) {
                JOptionPane.showMessageDialog(null, "Invalid number");
                return;
            } catch (SQLException ex) {
                if (ex.getErrorCode() == 2627) { //violate constraint
                    JOptionPane.showMessageDialog(null, "Duplicate Data");
                    return;
                }
                ex.printStackTrace();

            }
          }

    }
}
