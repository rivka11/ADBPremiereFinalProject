/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer;

import utilityClasses.ResultsTableModel;
import java.awt.BorderLayout;
import java.awt.Point;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.sql.Connection;
import java.sql.SQLException;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

public class ViewMyOrdersPanel extends JPanel {

    private Connection dbConnection;
    private ResultsTableModel tableModel;
    private static final long serialVersionUID = 1L;
    private JTable resultTable;

    public ViewMyOrdersPanel(Connection dbConnection)
      {
        //store the reference to the database --- back end
        this.dbConnection = dbConnection;

        //verify that a database connection exists
        if (this.dbConnection == null) {
            JOptionPane.showMessageDialog(null, "missing database connection --- contact IT");

        } else { //continue with this process

            //set window size
            setSize(600, 600);
            // Specify an action for the close button.

            this.setLayout(new BorderLayout());

            String query
                    = "select * from viewallordersview";

            try {
                //instantiate the model which will automatically fire off the 
                //execution of the query in String, query.
                tableModel = new ResultsTableModel(this.dbConnection, query);

                //create JTable based on the tableModel
                //the table holds the data that will be displayed on the screen
                resultTable = new JTable(tableModel);

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

        //set up layout of the window 			   	
        setVisible(true);

      }

}
