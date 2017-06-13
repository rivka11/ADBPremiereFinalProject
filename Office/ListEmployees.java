package Office;

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
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

public class ListEmployees extends JFrame implements WindowListener {

    private Connection dbConnection;
    private ResultsTableModel tableModel;
    private static final long serialVersionUID = 1L;
    private JTable resultTable;

    public ListEmployees(Connection dbConnection)
      {
        //store the reference to the database --- back end
        this.dbConnection = dbConnection;

        //verify that a database connection exists
        if (this.dbConnection == null) {
            JOptionPane.showMessageDialog(null, "missing database connection --- contact IT");

        } else { //continue with this process

            setTitle("Employee List");
            //set window size
            setSize(600, 600);
            // Specify an action for the close button.
            setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
            this.setLayout(new BorderLayout());

            String query
                    = "select empid, FirstName,  LastName,"
                    + "phoneNumber, empTypedesc"
                    + " from allemployeedataview";

            try {
                //instantiate the model which will automatically fire off the 
                //execution of the query in String, query.
                tableModel = new ResultsTableModel(this.dbConnection, query);

                //create JTable based on the tableModel
                //the table holds the data that will be displayed on the screen
                resultTable = new JTable(tableModel);
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
                            int empid = Integer.valueOf(table.getModel().getValueAt(selectedrow, 0).toString());

                            new ModifyEmployeeFromListOfEmpsOfficeRole(dbConnection, empid);
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
            

            } finally {
                tableModel.disconnectFromDatabase();
            }
        }

        //set up layout of the window 			   	
        pack();
        setVisible(true);

      }

    @Override
    public void windowActivated(WindowEvent e)
      {
        // TODO Auto-generated method stub

      }

    @Override
    public void windowClosed(WindowEvent e)
      {
        tableModel.disconnectFromDatabase();

      }

    @Override
    public void windowClosing(WindowEvent e)
      {
        // TODO Auto-generated method stub

      }

    @Override
    public void windowDeactivated(WindowEvent e)
      {
        // TODO Auto-generated method stub

      }

    @Override
    public void windowDeiconified(WindowEvent e)
      {
        // TODO Auto-generated method stub

      }

    @Override
    public void windowIconified(WindowEvent e)
      {
        // TODO Auto-generated method stub

      }

    @Override
    public void windowOpened(WindowEvent e)
      {
        // TODO Auto-generated method stub

      }
}
