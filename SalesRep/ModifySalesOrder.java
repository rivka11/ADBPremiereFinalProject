/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SalesRep;

import utilityClasses.ResultsTableModel;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Point;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

/**
 *
 * @author me
 */
public class ModifySalesOrder extends JPanel {

    private Connection dbConnection;
    private ResultsTableModel tableModel;

    public ModifySalesOrder(Connection dbConnection)
      {
        this.dbConnection = dbConnection;
        String query
                = "select order_num, cust_num, order_date from viewAllCustomerOrders";
        try {
            //instantiate the model which will automatically fire off the 
            //execution of the query in String, query.
            tableModel = new ResultsTableModel(this.dbConnection, query);

            //create JTable based on the tableModel
            //the table holds the data that will be displayed on the screen
            JTable resultTable = new JTable(tableModel);
            resultTable.getTableHeader().setReorderingAllowed(false);
            resultTable.addMouseListener(new MouseAdapter() {
                @Override
                public void mousePressed(MouseEvent me)
                  {
                    JTable table = (JTable) me.getSource();
                    Point p = me.getPoint();
                    int row = table.rowAtPoint(p);

                    if (me.getClickCount() == 2) {
                        System.out.println("hit it");
                        int selectedrow = table.getSelectedRow();
                        int ordernum = Integer.valueOf(table.getModel().getValueAt(selectedrow, 0).toString());
                        new ModifySalesOrderFrame(dbConnection, ordernum);
                    }

                  }
            });
            //place components in the window
            //place table in a scrollpane so that user can scroll through the 
            //contents of the table
            this.add(new JScrollPane(resultTable), BorderLayout.CENTER);

            //adding a row sorter will allow the user to click on any column heading
            //in order to resort the rows by the data in that column
            final TableRowSorter<TableModel> sorter
                    = new TableRowSorter<TableModel>(tableModel);
            resultTable.setRowSorter(sorter);

            //set window size and make it and its components visible on the screen
            setSize(500, 250);
            setVisible(true);

        } catch (SQLException sqlException) {
            JOptionPane.showMessageDialog(null, sqlException.getMessage());
          

        }finally{
                  tableModel.disconnectFromDatabase();
            }
      }

}
