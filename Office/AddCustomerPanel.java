/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Office;

import utilityClasses.UtilityClass;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;

/**
 *
 * @author me
 */
public class AddCustomerPanel extends javax.swing.JPanel {

    Connection dbConnection;

    /**
     * Creates new form AddCustomerPanel
     */
    public AddCustomerPanel(Connection dbConnection)
      {
        this.dbConnection = dbConnection;
        initComponents();
      }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents()
    {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        stateComboBox = new javax.swing.JComboBox<>();
        fNameText = new javax.swing.JTextField();
        phoneTxt = new javax.swing.JTextField();
        cityTxt = new javax.swing.JTextField();
        streetTxt = new javax.swing.JTextField();
        addNewCustomerButton = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();
        zipTxt = new javax.swing.JTextField();
        repNumCombo = new javax.swing.JComboBox<>();
        checkBoxCustomerLogin = new javax.swing.JCheckBox();
        logintxt = new javax.swing.JTextField();
        loginNameLabel = new javax.swing.JLabel();

        jLabel1.setText("Customer name");

        jLabel2.setText("Customer phone");

        jLabel4.setText("City");

        jLabel5.setText("Street");

        jLabel6.setText("State");

        jLabel7.setText("zipcode");

        stateComboBox.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY" }));
        stateComboBox.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                stateComboBoxActionPerformed(evt);
            }
        });

        addNewCustomerButton.setText("Add Customer");
        addNewCustomerButton.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                addNewCustomerButtonActionPerformed(evt);
            }
        });

        jLabel8.setText("Rep Number");

        repNumCombo.setModel(new DefaultComboBoxModel(getSalesRepNums()));
        repNumCombo.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                repNumComboActionPerformed(evt);
            }
        });

        checkBoxCustomerLogin.setSelected(true);
        checkBoxCustomerLogin.setText("create Customer Login");
        checkBoxCustomerLogin.addItemListener(new java.awt.event.ItemListener()
        {
            public void itemStateChanged(java.awt.event.ItemEvent evt)
            {
                checkBoxCustomerLoginItemStateChanged(evt);
            }
        });
        checkBoxCustomerLogin.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                checkBoxCustomerLoginActionPerformed(evt);
            }
        });

        loginNameLabel.setText("Login name");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(cityTxt, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(45, 45, 45)
                                .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(stateComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 56, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(zipTxt, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(repNumCombo, javax.swing.GroupLayout.PREFERRED_SIZE, 65, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(loginNameLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(logintxt, javax.swing.GroupLayout.PREFERRED_SIZE, 78, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGap(50, 50, 50)
                                .addComponent(checkBoxCustomerLogin)))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(streetTxt, javax.swing.GroupLayout.PREFERRED_SIZE, 422, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(phoneTxt, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(fNameText, javax.swing.GroupLayout.PREFERRED_SIZE, 358, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 0, Short.MAX_VALUE))))
            .addGroup(layout.createSequentialGroup()
                .addGap(169, 169, 169)
                .addComponent(addNewCustomerButton, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(fNameText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(streetTxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(stateComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7)
                    .addComponent(jLabel4)
                    .addComponent(cityTxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(zipTxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(11, 11, 11)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(phoneTxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(34, 34, 34)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(repNumCombo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(checkBoxCustomerLogin))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(logintxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(loginNameLabel))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 33, Short.MAX_VALUE)
                .addComponent(addNewCustomerButton, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(41, 41, 41))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void stateComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_stateComboBoxActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_stateComboBoxActionPerformed

    private void addNewCustomerButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addNewCustomerButtonActionPerformed

        String sql = "insert into customerdata(cust_name, cust_street, cust_city, cust_state, cust_zip,  phone, rep_num, cust_login) values(?,?,?,?,?,?,?,?)";
        if (UtilityClass.checkEmpty(fNameText, streetTxt, cityTxt, zipTxt, phoneTxt)) {
            //JOptionPane.showMessageDialog(null, "fields name, street, city and phone must be completed");
            UtilityClass.showErrorMessage("fields name, street, city and phone must be completed");
            return;
        }
        try (PreparedStatement ps = dbConnection.prepareStatement(sql)) {

            ps.setString(1, fNameText.getText());
            ps.setString(2, streetTxt.getText());
            ps.setString(3, cityTxt.getText());
            ps.setString(4, stateComboBox.getSelectedItem().toString());
            if (zipTxt.getText().length() != 5) {
                UtilityClass.showErrorMessage("zipcode is only 5 digits");
                return;
            }
            ps.setString(5, zipTxt.getText());
            if (phoneTxt.getText().length() != 10) {//TODO make sure only numbers
                UtilityClass.showErrorMessage("phone number must be 10 digits");
                return;
            }
            ps.setString(6, phoneTxt.getText());
            ps.setInt(7, (Integer) repNumCombo.getSelectedItem());

            //login is optional
            if (checkBoxCustomerLogin.isSelected()) {
                if (!UtilityClass.checkEmpty(logintxt)) {
                    ps.setString(8, logintxt.getText());
                }
            } else {
                ps.setString(8, null);
            }
            ps.execute();
            dbConnection.commit();
            //TODO login not actually created!!
            JOptionPane.showMessageDialog(null, "Customer added");
            UtilityClass.emptyAllFields(fNameText, streetTxt, cityTxt, zipTxt, phoneTxt, logintxt);

        } catch (SQLException ex) {
            if (ex.getErrorCode() == 2627) { //violate constraint
                JOptionPane.showMessageDialog(null, "Duplicate Data");
                return;
            } else {
                UtilityClass.showErrorMessage(ex.getMessage());
            }
            // ex.printStackTrace();
        }
    }//GEN-LAST:event_addNewCustomerButtonActionPerformed

    private void repNumComboActionPerformed(java.awt.event.ActionEvent evt)//GEN-FIRST:event_repNumComboActionPerformed
    {//GEN-HEADEREND:event_repNumComboActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_repNumComboActionPerformed

    private void checkBoxCustomerLoginItemStateChanged(java.awt.event.ItemEvent evt)//GEN-FIRST:event_checkBoxCustomerLoginItemStateChanged
    {//GEN-HEADEREND:event_checkBoxCustomerLoginItemStateChanged
        if (checkBoxCustomerLogin.isSelected()) {
            logintxt.setEnabled(true);

        } else {
            logintxt.setEnabled(false);

        }
    }//GEN-LAST:event_checkBoxCustomerLoginItemStateChanged

    private void checkBoxCustomerLoginActionPerformed(java.awt.event.ActionEvent evt)//GEN-FIRST:event_checkBoxCustomerLoginActionPerformed
    {//GEN-HEADEREND:event_checkBoxCustomerLoginActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_checkBoxCustomerLoginActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton addNewCustomerButton;
    private javax.swing.JCheckBox checkBoxCustomerLogin;
    private javax.swing.JTextField cityTxt;
    private javax.swing.JTextField fNameText;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel loginNameLabel;
    private javax.swing.JTextField logintxt;
    private javax.swing.JTextField phoneTxt;
    private javax.swing.JComboBox<Integer> repNumCombo;
    private javax.swing.JComboBox<String> stateComboBox;
    private javax.swing.JTextField streetTxt;
    private javax.swing.JTextField zipTxt;
    // End of variables declaration//GEN-END:variables

    private Integer[] getSalesRepNums()
      {
        ArrayList<Integer> nums = new ArrayList<>();
        Integer[] numsReturn = null;//= (Integer[]) nums.toArray();
        String query = "select rep_Num from salesRepNumView";
        try (Statement s = dbConnection.createStatement()) {
            try (ResultSet rs = s.executeQuery(query)) {

                while (rs.next()) {
                    nums.add(rs.getInt("rep_Num"));
                }

                numsReturn = new Integer[nums.size()];

                for (int i = 0; i < numsReturn.length; i++) {
                    numsReturn[i] = nums.get(i);
                }

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return numsReturn;
      }
}
