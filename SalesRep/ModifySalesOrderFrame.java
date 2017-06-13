/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SalesRep;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author Rivka Schuster
 */
public class ModifySalesOrderFrame extends JFrame {

    private Connection dbConnection;
    private JButton updateButton;
   // private JButton deleteOrder;

    private JTextField priceTxt;
    private JTextField qtyTxt;
    private JTextField parttxt;
    private int ordernum;

    public ModifySalesOrderFrame(Connection db, int orderNum)
      {
        if (db == null) {
            System.out.println("error");
            System.exit(1);
        }
       // this.deleteOrder =new JButton("Delete Order");
        this.ordernum = orderNum;
        this.setSize(700, 700);
        this.setTitle("Modify order");
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        this.setLayout(new GridLayout(5, 2));

        this.dbConnection = db;
        String query;

        //TODO change to prepared statement
        query = "select part_num, qty_ordered, quoted_price from viewallcustomerorders where order_Num = ?";

        try {

            PreparedStatement q = dbConnection.prepareStatement(query);
            q.setInt(1, orderNum);
            ResultSet rs = q.executeQuery();
              double price=0;
               int qty=0;
                String part=null;
                      
            while (rs.next()) {
                price = rs.getDouble("quoted_price");
                qty = rs.getInt("qty_ordered");
                part = rs.getString("part_num");
            }
                this.priceTxt = new JTextField(String.valueOf(price));

                this.qtyTxt = new JTextField(String.valueOf(qty));
                this.parttxt = new JTextField(part);

                this.updateButton = new JButton("update");
                this.updateButton.addActionListener(new UpdateListener(this));
            
                this.add(this.parttxt);
                this.add(this.qtyTxt);
                this.add(this.priceTxt);

                this.add(this.updateButton);
              //  this.deleteOrder.addActionListener(new DeleteOrderListener());
             //   this.add(this.deleteOrder);

           // }

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

            //         String query = "UPDATE modifyEmployeeData SET  LastName = '" + Lnametxt.getText()
            //                 + "'  WHERE firstName = '" + oldFname + "' and lastName = '" + oldLname + "'";
            String query = "UPDATE viewAllCustomerorders SET quoted_price = ?, part_num = ?, qty_ordered = ? where order_num = ? ";

            System.out.println(query);
            try {
                PreparedStatement s = dbConnection.prepareStatement(query);
                s.setDouble(1, Double.parseDouble(priceTxt.getText()));
                s.setString(2, parttxt.getText());
                s.setInt(3, Integer.parseInt(qtyTxt.getText()));
                s.setInt(4, ordernum);

                s.executeUpdate();
                dbConnection.commit();
                JOptionPane.showMessageDialog(null, "Update successful!");
                s.close();
                //close this window
                window.dispose();

            } catch (NumberFormatException o) {
                JOptionPane.showMessageDialog(null, "Invalid number");
                return;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

          }

    }
 private class DeleteOrderListener implements ActionListener {

        JFrame window;

        public DeleteOrderListener(JFrame window)
          {
            this.window = window;
          }

        @Override
        public void actionPerformed(ActionEvent e)
          {

          
            String query = "UPDATE viewAllCustomerorders SET quoted_price = ?, part_num = ?, qty_ordered = ? where order_num = ? ";

            System.out.println(query);
            try {
                PreparedStatement s = dbConnection.prepareStatement(query);
                s.setDouble(1, Double.parseDouble(priceTxt.getText()));
                s.setString(2, parttxt.getText());
                s.setInt(3, Integer.parseInt(qtyTxt.getText()));
                s.setInt(4, ordernum);

                s.executeUpdate();
                dbConnection.commit();
                JOptionPane.showMessageDialog(null, "Update successful!");
                s.close();
                //close this window
                window.dispose();

            } catch (NumberFormatException o) {
                JOptionPane.showMessageDialog(null, "Invalid number");
                return;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

          }

    }

}
