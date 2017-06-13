package WarehouseManager;

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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author Rivka Schuster
 */
public class ModifyPurchasePanel extends JPanel {

    /**
     * 	When a product that has been Purchased is received, the Warehouse
     * Manager is authorized to modify the Purchase information, qtyReceived,
     * dateReceived, managerid, warehouseid of the specific Purchase that was
     * entered in the Purchase table by the Buyer. When this information is
     * entered into the Purchase table, the units_on_hand of that Part’s record
     * will be updated automatically .
     */
    private JComboBox<Integer> purchases;
    private Connection dbConnection;
    private JButton updateButton;
    private JTextField qtyreceivedtxt;
    private JTextField datereceivedtxt;
    private JTextField receivedbytxt;
    private JTextField warehouseidtxt;

    private JTextField purchaseIDtxt;
    private JTextField partNumtxt;
    private JTextField unitpricepaidtxt;
    private JTextField datepurchasedtxt;

    private JLabel qtyreceivedlbl;
    private JLabel datereceivedlbl;
    private JLabel receivedbylbl;
    private JLabel warehouseidlbl;

    private JLabel purchaseIDlbl;
    private JLabel partNumlbl;
    private JLabel unitpricepaidlbl;
    private JLabel datepurchasedlbl;

    /**
     *
     * @param db
     */
    public ModifyPurchasePanel(Connection db)
      {
        if (db == null) {
            System.out.println("error");
        }

        this.setSize(700, 700);

        this.setLayout(new GridLayout(9, 2));

        qtyreceivedlbl = new JLabel("quantity received");
        datereceivedlbl = new JLabel("date received");
        receivedbylbl = new JLabel("received by employee: ");
        warehouseidlbl = new JLabel("warehouse id");

        purchaseIDlbl = new JLabel("purchaseID");
        partNumlbl = new JLabel("part");
        unitpricepaidlbl = new JLabel("price paid");
        datepurchasedlbl = new JLabel("purchased on: ");

        this.dbConnection = db;
        String query = "select * from purchasedataview where purchaseID = ?";

        try (PreparedStatement q = dbConnection.prepareStatement(query)) {
            q.setInt(1, (Integer) purchases.getSelectedItem());
            
            try (ResultSet rs = q.executeQuery(query)) {

                while (rs.next()) {
                    String datereceived = rs.getString("datereceived");
                    String qtyreceived = rs.getString("qtyreceived");
                    String receivedby = rs.getString("receivedby");
                    String warehouseid = rs.getString("warehouseid");

                    Date datepurchased = rs.getDate("datepurchased");
                    String partnum = rs.getString("part_num");
                    Integer purchaseid = rs.getInt("purchaseID");
                    Double unitprice = rs.getDouble("unitpricepaid");

                    if (datereceived == null) {
                        this.datereceivedtxt = new JTextField();

                    } else {
                        this.datereceivedtxt = new JTextField("Date received");
                    }

                    if (qtyreceived == null) {
                        this.qtyreceivedtxt = new JTextField();
                    } else {
                        this.qtyreceivedtxt = new JTextField(qtyreceived);
                    }

                    if (receivedby == null) {
                        this.receivedbytxt = new JTextField();
                    } else {
                        this.receivedbytxt = new JTextField(receivedby);
                    }
                    if (warehouseid == null) {
                        this.warehouseidtxt = new JTextField();
                    } else {
                        this.warehouseidtxt = new JTextField(warehouseid);
                    }

                    this.updateButton = new JButton("update");
                    this.updateButton.addActionListener(new UpdateListener());

                    purchaseIDtxt = new JTextField(purchaseid);
                    this.purchaseIDtxt.setEditable(false);
                    partNumtxt = new JTextField(partnum);
                    this.partNumtxt.setEditable(false);
                    unitpricepaidtxt = new JTextField(unitprice.toString());
                    this.unitpricepaidtxt.setEditable(false);
                    datepurchasedtxt = new JTextField(datepurchased.toString());
                    this.datepurchasedtxt.setEditable(false);

                    this.add(this.purchaseIDlbl);
                    this.add(this.purchaseIDtxt);

                    this.add(this.datepurchasedlbl);
                    this.add(this.datepurchasedtxt);

                    this.add(this.partNumlbl);
                    this.add(this.partNumtxt);

                    this.add(this.unitpricepaidlbl);
                    this.add(this.unitpricepaidtxt);

                    this.add(this.receivedbylbl);
                    this.add(this.receivedbytxt);

                    this.add(this.warehouseidlbl);
                    this.add(this.warehouseidtxt);

                    this.add(this.qtyreceivedlbl);
                    this.add(this.qtyreceivedtxt);

                    this.add(this.datereceivedlbl);
                    this.add(this.datereceivedtxt);

                    this.add(this.updateButton);

                }

            }

        } catch (SQLException ex) {
            System.out.println("error from here");
            ex.printStackTrace();
        }

        this.setVisible(
                true);

      }

    private class UpdateListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {

            //         String query = "UPDATE modifyEmployeeData SET  LastName = '" + Lnametxt.getText()
            //                 + "'  WHERE firstName = '" + oldFname + "' and lastName = '" + oldLname + "'";
            String query = "UPDATE purchasedataview SET qtyreceived = ?, receivedby = ?, warehouseid = ?, datereceived = ? , zipcode = ?, phonenumber = ? where purchaseID = ?";

            System.out.println(query);
            try (PreparedStatement s = dbConnection.prepareStatement(query)) {

                s.setInt(1, Lnametxt.getText());
                s.setInt(2, streettxt.getText());
                s.setString(3, citytxt.getText());
                s.setString(4, (String) stateCombo.getSelectedItem());
                s.setString(5, ziptxt.getText());
                s.setString(6, phonetxt.getText());

                s.executeUpdate();
                dbConnection.commit();
                JOptionPane.showMessageDialog(null, "Update successful!");
                //close this window

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

          }

    }

}
