package JavaPremiereDBSQLSecurityApp;

import utilityClasses.Roles;
import Office.AddCustomerPanel;
import Employee.ModifyMyAccountFrame;
import Office.ListEmployees;
import Office.ListCustomers;
import SalesRep.ViewCustomerOrderPanel;
import WarehouseManager.ViewWarehousePanel;
import WarehouseManager.ModifyPurchasePanel;
import Buyer.AddPartPanel;
import SalesRep.ViewAllCustomerOrdersSalesRepPanel;
import SalesRep.AddOrderGeneratedPanel;
import SalesRep.ModifySalesOrder;
import Accountant.ModifyCrLimitPanel;
import Accountant.SetPricePanel;
import Accountant.AddSalesRepPanel;
import Customer.ViewMyOrdersPanel;
import Customer.ModifyMyCustomerAccountFrame;
import java.awt.BorderLayout;
import java.awt.CardLayout;
import javax.security.auth.*;
import javax.security.auth.login.*;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class MainMenuFrame extends JFrame implements WindowListener {

    private JMenuBar premiereMenuBar;

    private JMenu salesMenu, employeeMenu, customerMenu, purchaseMenu;
    private JMenuItem addSalesItem, modifySalesItem, cancelSalesItem, viewSalesItem, viewSalesOrdersItem;
    private JMenuItem addEmployeeMenuItem, modifyEmployeeMenuItem, modifySalesRepMenuItem, addSalesRepMenuItem,
            viewEmployeeMenuItem, listEmployeesMenuItem;
    private JMenuItem addcustomerMenuItem, modifyCustomerMenuItem, listCustomersMenuItem;
    private JMenuItem purchasesMenuItem, viewWareHouseMenuItem;
    private Connection dbConnection;
    private CardLayout cl;
    private Roles allRoles;
    private JMenuItem modifyMyAccountMenuItem;

    private JPanel contentPanel;
    private JMenu guestMenu;
    private JMenuItem partsMenuItem;
    private JMenu secretaryMenu;
    private JMenu accountantMenu;
    private JMenu warehouseManagerMenu;
    private JMenuItem modifyPurchaseMenuItem;
    private JMenu menuForCutomersMenu;
    private JMenuItem viewMyOrdersMenuItem;
    private JMenuItem modifyMyCustomerAccountMenuItem;
    private JMenuItem modifyCustomerCreditLimitMenuItem;
    private JMenuItem changePriceMenuItem;
    private JMenu buyerMenu;
    private JMenuItem addNewPartMenuItem;
    private JMenuItem viewAllPartsMenuItem;

    public MainMenuFrame(Connection dbConnection)
      {
        this.setSize(700, 700);
        this.setPreferredSize(getSize());
        this.setTitle("Premiere Application");
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        this.setLayout(new BorderLayout());
        //first display LoginFrame
        this.dbConnection = dbConnection;
        ArrayList<String> databaseRoles;
        databaseRoles = getDatabaseRoles();
        setUpMenuBar(databaseRoles);
        this.setJMenuBar(premiereMenuBar);   //add menu bar to the window
        this.contentPanel = new JPanel(new CardLayout());
        this.add(contentPanel, BorderLayout.CENTER);

        cl = (CardLayout) contentPanel.getLayout();
        pack();

        this.setVisible(true);
      }

    private String getLoginName()
      {
        try {
            Statement sqlStatement = dbConnection.createStatement();
            ResultSet r = sqlStatement.executeQuery("select suser_sname()");
            r.next();
            return r.getString(1);

        } catch (SQLException o) {
            o.printStackTrace();
        }
        return null;
      }

    private ArrayList<String> getDatabaseRoles()
      {
        /*
 * USER_NAME() - database username - a.k.a USER and CURRENT_USER

             * SUSER_SNAME() - login identification name - supersedes SUSER_NAME() 
         */

        ArrayList<String> databaseRoles = new ArrayList<String>(); //to store the roles that the current Login has been assigned
        String currentLogin;
        //set up a Statement that can query the sql server
        Statement sqlStatement = null;

        //set up the query to get the SQL Server login if using SQL Server authentication
        String query
                = "select suser_sname()";
        //now create an instance of Statement
        //and use it to execute the query
        try {
            sqlStatement = dbConnection.createStatement();
            //execute the query
            ResultSet rs = sqlStatement.executeQuery(query);
            //move to first record in the resultset
            rs.next();
            //retrieve data from first column in the resultset
            //there should be only one row and one column
            currentLogin = rs.getString(1);

            System.out.println("current login " + currentLogin);

            //now get the user and the role(s) associated with the
            //user that is associated with this sql server login
            query
                    = "select u.name, r.name "
                    + "from [PREMIERE].sys.database_role_members as m "
                    + "inner join [PREMIERE].sys.database_principals r "
                    + "on m.role_principal_id = r.principal_id "
                    + "inner join [PREMIERE].sys.database_principals as u "
                    + "on u.principal_id = m.member_principal_id "
                    + "where u.name = "
                    + //access sql logins instead of windows logins
                    "(select u.name from [PREMIERE].sys.sql_logins  l "
                    + "inner join [PREMIERE].sys.sysusers  u "
                    + "on l.sid = u.sid "
                    + "where l.name = " + "'" + currentLogin + "')";

            //now execute this query
            rs = sqlStatement.executeQuery(query);
            //now check the results that came back
            if (!rs.next()) {
                return null;   //no database roles were assigned
            } else {
                //iterate through the resultset
                do {
                    //get the data from the first row
                    String currentUser
                            = rs.getString(1);
                    String currentDBRole
                            = rs.getString(2);
                    if (!(currentDBRole == null)) {

                        System.out.println("current user" + currentUser + " current role" + currentDBRole);
                        databaseRoles.add(currentDBRole);
                    }
                } while (rs.next());  //go to next row
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "couldnt retrieve data");
            ex.printStackTrace();
            return null;
        }

        return databaseRoles;    //if no roles were assigned to this particular login
        //it must be a guest
      }

    private void setUpMenuBar(ArrayList<String> databaseRoles)
      {
        //set up the menu bar
        this.premiereMenuBar = new JMenuBar();
        //set up and add the main menus to the menu bar
        if (databaseRoles != null && databaseRoles.isEmpty()
                || databaseRoles == null) {
            //no roles were assigned to user that is currently logged in
            //TODO guest role????
            System.out.println("not authorized to use this system.... contact IT ");
            this.dispose();   //close this window
            System.exit(1);  //end the application
        }
        //guest menu 
        if (databaseRoles.contains(Roles.PR_GuestRole.name())) {
            this.guestMenu = new JMenu("Welcome " + getLoginName());
            this.partsMenuItem = new JMenuItem("View all Products");
            this.partsMenuItem.addActionListener(new ViewAllPartsListener());
            this.guestMenu.add(this.partsMenuItem);
            premiereMenuBar.add(guestMenu);

        } else {
            //Employee Menu
            if (!databaseRoles.contains(Roles.PR_CustomerRole.name())) { //only one that is not employee
                //display employee related menu
                this.employeeMenu = new JMenu("Welcome  " + getLoginName());
                premiereMenuBar.add(employeeMenu);

                this.modifyMyAccountMenuItem = new JMenuItem("My account");
                this.modifyMyAccountMenuItem.addActionListener(new ModifyEmployeeListener());
                this.employeeMenu.add(this.modifyMyAccountMenuItem);
                /**
                 * SECRETARY
                 */

                if (databaseRoles.contains(Roles.PR_OfficeRole.name())) {
                    this.secretaryMenu = new JMenu("Secretary");
                    premiereMenuBar.add(this.secretaryMenu);

                    //secretary can modify employee
                    this.modifyEmployeeMenuItem = new JMenuItem("Modify Employee Data");
                    this.modifyEmployeeMenuItem.addActionListener(new ModifyEmployeesListener());
                    this.secretaryMenu.add(modifyEmployeeMenuItem);

                    //secretary can add customer
                    this.addcustomerMenuItem = new JMenuItem("Add Customer");
                    this.addcustomerMenuItem.addActionListener(new AddCustomerListener());
                    this.secretaryMenu.add(this.addcustomerMenuItem);

                    //secretary can modify customer
                    this.modifyCustomerMenuItem = new JMenuItem("Modify Customer");
                    this.modifyCustomerMenuItem.addActionListener(new ListCustomersListener());
                    this.secretaryMenu.add(this.modifyCustomerMenuItem);

                    this.secretaryMenu.addSeparator();

                    //secretatry can view employees
                    this.listEmployeesMenuItem = new JMenuItem("List Employees");
                    this.listEmployeesMenuItem.addActionListener(new ListEmployeesListener());
                    this.secretaryMenu.add(this.listEmployeesMenuItem);

                    //secreatery can view customers
                    this.listCustomersMenuItem = new JMenuItem("List Customers");
                    this.listCustomersMenuItem.addActionListener(new ListCustomersListener());
                    this.secretaryMenu.add(this.listCustomersMenuItem);

                }
                /**
                 * ACCOUNTANT
                 */
                if (databaseRoles.contains(Roles.PR_AccountantRole.name())) {
                    this.accountantMenu = new JMenu("Accountant");
                    premiereMenuBar.add(this.accountantMenu);

                    this.addSalesRepMenuItem = new JMenuItem("Add sales rep");
                    this.addSalesRepMenuItem.addActionListener(new AddSalesRepListener());
                    this.accountantMenu.add(this.addSalesRepMenuItem);

                    this.changePriceMenuItem = new JMenuItem("Change price of part");
                    this.changePriceMenuItem.addActionListener(new ChangePriceListener());
                    this.accountantMenu.add(this.changePriceMenuItem);

                    this.accountantMenu.addSeparator();   //add separate between modify operations and list operations

                    this.modifyCustomerCreditLimitMenuItem = new JMenuItem("Modify customer credit Limit");
                    this.modifyCustomerCreditLimitMenuItem.addActionListener(new ModifyCreditLimitActionListener());
                    this.accountantMenu.add(this.modifyCustomerCreditLimitMenuItem);

                    //Accountant can modify salesrep?!
                    this.modifySalesRepMenuItem = new JMenuItem("Modify SalesRep Data");
                    //this.modifySalesRepMenuItem.addActionListener(new ModifySalesRepListener());
                    this.accountantMenu.add(modifySalesRepMenuItem);

                    //TODO is this permission?         
//                    this.viewEmployeeMenuItem = new JMenuItem("View Employee Data");
//                    this.accountantMenu.add(viewEmployeeMenuItem);
//
//                    this.listEmployeesMenuItem = new JMenuItem("List Employees");
//                    this.listEmployeesMenuItem.addActionListener(new ListEmployeesActionListener());
//                    this.accountantMenu.add(listEmployeesMenuItem);
                }

                /**
                 * WAREHOUSE MANAGER
                 */
                if (databaseRoles.contains(Roles.PR_WarehouseManagerRole.name())) {
                    this.warehouseManagerMenu = new JMenu("Warehouse Manager");
                    premiereMenuBar.add(this.warehouseManagerMenu);

                    //view items in warehouse
                    this.viewWareHouseMenuItem = new JMenuItem("View Items");
                    this.viewWareHouseMenuItem.addActionListener(new ViewWarehouseListener());
                    this.warehouseManagerMenu.add(this.viewWareHouseMenuItem);

                    //modify purchase information
                    this.modifyPurchaseMenuItem = new JMenuItem("Modify Purchase");
                    this.modifyPurchaseMenuItem.addActionListener(new ModifyPurchaseListener(this));
                    this.warehouseManagerMenu.add(this.modifyPurchaseMenuItem);

                }

                /**
                 * SALES ROLE
                 */
                if (databaseRoles.contains(Roles.PR_SalesRole.name())) {
                    //current user was assigned SalesRole
                    this.salesMenu = new JMenu("Sales");
                    premiereMenuBar.add(salesMenu);

                    //set up each menu item and add the item to the menu on the menu bar
                    this.addSalesItem = new JMenuItem("Add Sales Order");
                    this.modifySalesItem = new JMenuItem("Modify Sales Order");
                    this.modifySalesItem.addActionListener(new ModifyOrderActionListener());
                    this.cancelSalesItem = new JMenuItem("Cancel Sales Order");

                    this.salesMenu.add(addSalesItem);
                    this.salesMenu.add(modifySalesItem);

                    this.salesMenu.add(cancelSalesItem);
                    this.salesMenu.addSeparator();   //add separate between modify operations and list operations
                    this.viewSalesItem = new JMenuItem("View Sales Order"); // enter customer information
                    this.viewSalesOrdersItem = new JMenuItem("View All Sales Orders"); //same as above, just not clikable

                    this.salesMenu.add(viewSalesItem);
                    this.salesMenu.add(viewSalesOrdersItem);

                    this.addSalesItem.addActionListener(new AddSalesOrderListener());
                    this.viewSalesOrdersItem.addActionListener(new ViewAllOrdersListener());

                    this.cancelSalesItem.addActionListener(new CancelSalesListener());
                    this.viewSalesItem.addActionListener(new ViewOrderForCustomerListener());
                }
                /**
                 * Buyer Role
                 */
                if (databaseRoles.contains(Roles.PR_BuyerRole.name())) {
                    this.buyerMenu = new JMenu("Buyer");
                    premiereMenuBar.add(buyerMenu);
                    
                    //buyer role can add new part
                    this.addNewPartMenuItem = new JMenuItem("add part");
                    this.addNewPartMenuItem.addActionListener(new AddPartListener());
                    this.buyerMenu.add(this.addNewPartMenuItem);

                    //buyer can view list of parts
                    this.viewAllPartsMenuItem = new JMenuItem("view all parts");
                    this.viewAllPartsMenuItem.addActionListener(new ViewAllPartsListener());
                    this.buyerMenu.add(this.viewAllPartsMenuItem);

                }

//                //Customer Menu
//                if (databaseRoles.contains(Roles.PR_CustomerRole.name())
//                        || databaseRoles.contains(Roles.PR_OfficeRole.name())
//                        || databaseRoles.contains(Roles.PR_AccountantRole.name())) {
//                    this.customerMenu = new JMenu("Customer");
//                    premiereMenuBar.add(customerMenu);
////            this.addcustomerMenuItem = new JMenuItem("Add Customer");
////            this.addcustomerMenuItem.addActionListener(new AddCustomerListener());
//                    this.modifyCustomerMenuItem = new JMenuItem("Modify Customer");
//                    //add submenus to the main menu
//                    //  this.customerMenu.add(addcustomerMenuItem);
//                    this.customerMenu.add(modifyCustomerMenuItem);
//
//                    if (databaseRoles.contains(Roles.PR_AccountantRole.name())) {
//                        this.customerMenu.addSeparator();   //add separate between modify operations and list operations
//                        this.listCustomersMenuItem = new JMenuItem("List Customers");
//                        this.customerMenu.add(listCustomersMenuItem);
//                        //connect menu item to the appropriate ActionListener
//                        this.listCustomersMenuItem.addActionListener(new ListCustomersListener());
//                    }
//                }
            }
            if (databaseRoles.contains(Roles.PR_CustomerRole.name())) {
                this.menuForCutomersMenu = new JMenu("Welcome Customer " + getLoginName());
                this.premiereMenuBar.add(this.menuForCutomersMenu);

                //modify my data
                this.modifyMyCustomerAccountMenuItem = new JMenuItem("My Account");
                this.modifyMyCustomerAccountMenuItem.addActionListener(new ModifyMyCustomerAccountListener());
                this.menuForCutomersMenu.add(this.modifyMyCustomerAccountMenuItem);

                //view orders
                this.viewMyOrdersMenuItem = new JMenuItem("View orders");
                this.viewMyOrdersMenuItem.addActionListener(new ViewOrdersActionListener());
                this.menuForCutomersMenu.add(this.viewMyOrdersMenuItem);

            }
        }
      }

    @Override
    public void windowActivated(WindowEvent e
    )
      {
        // TODO Auto-generated method stub

      }

    @Override
    public void windowClosed(WindowEvent e
    )
      {
        System.exit(0);   //window close , exit the application
      }

    @Override
    public void windowClosing(WindowEvent e)
      {
        try {
            dbConnection.close();  //close connection to database
            dispose(); //close and dispose of this window
        } catch (SQLException sqlexception) {
            JOptionPane.showMessageDialog(null, "couldn't close connection to database");
        }

      }

    @Override
    public void windowDeactivated(WindowEvent e
    )
      {

      }

    @Override
    public void windowDeiconified(WindowEvent e
    )
      {
        // TODO Auto-generated method stub

      }

    @Override
    public void windowIconified(WindowEvent e
    )
      {
        // TODO Auto-generated method stub

      }

    @Override
    public void windowOpened(WindowEvent e
    )
      {
        // TODO Auto-generated method stub

      }

    private class AddPartListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {
            contentPanel.add(new AddPartPanel(dbConnection), "addPart");
            cl.show(contentPanel, "addPart");
            System.out.println("add part showing");
          }

    }

    public class ModifyOrderActionListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {
            contentPanel.add(new ModifySalesOrder(dbConnection), "modifySalesOrder");
            cl.show(contentPanel, "modifySalesOrder");
            System.out.println("modify order showing");
          }

    }

    private class ModifyCreditLimitActionListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {
            contentPanel.add(new ModifyCrLimitPanel(dbConnection), "modifyCommsionPanel");
            cl.show(contentPanel, "modifyCommissionPanel");
            System.out.println("cr limit showing");
          }

    }

    private class ViewOrderForCustomerListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {
            contentPanel.add(new ViewCustomerOrderPanel(dbConnection), "viewCustomerOrder");
            cl.show(contentPanel, "viewCustomerOrder");
            System.out.println("orders showing");
          }

    }

    private class ListCustomersListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            //new ListCustomers(dbConnection);
            contentPanel.add(new ListCustomers(dbConnection), "listCustomers");
            cl.show(contentPanel, "listCustomers");

          }

    }

    private class ChangePriceListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {

            contentPanel.add(new SetPricePanel(dbConnection), "setPrice");

            cl.show(contentPanel, "setPrice");
          }
    }

    private class ViewAllPartsListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            System.out.println("view all parts clicked");
            contentPanel.add(new ListAllProducts(dbConnection), "ListAllProducts");

            //  CardLayout cl = (CardLayout) contentPanel.getLayout();
            cl.show(contentPanel, "listAllProducts");

          }

    }

    private class ListEmployeesListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            new ListEmployees(dbConnection);

          }

    }

    private class ModifyMyCustomerAccountListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
//            contentPanel.add(new ListEmployees(dbConnection), "listEmps");
//
//            //  CardLayout cl = (CardLayout) contentPanel.getLayout();
//            cl.show(contentPanel, "listEmps");
            new ModifyMyCustomerAccountFrame(dbConnection);

          }

    }

    private class ViewAllOrdersListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {
            // viewAllCustomerOrders
            contentPanel.add(new ViewAllCustomerOrdersSalesRepPanel(dbConnection), "viewCustomerOrders");
            cl.show(contentPanel, "viewCustomerOrders");

          }

    }

  
//should this be allowed?

    private class CancelSalesListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            contentPanel.add(new ModifySalesOrder(dbConnection), "deleteOrder");
            cl.show(contentPanel, "deleteOrder");

          }

    }

    private class ModifyEmployeesListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            //   contentPanel.add(new ListEmployees(dbConnection), "listEmps");
            new ListEmployees(dbConnection);

            //  CardLayout cl = (CardLayout) contentPanel.getLayout();
            //  cl.show(contentPanel, "listEmps");
          }

    }

    private class ViewWarehouseListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            contentPanel.add(new ViewWarehousePanel(dbConnection), "viewWarehouse");
            cl.show(contentPanel, "viewWarehouse");

            /*
            select part.warehouseID, part_num, PART_DESCRIPTION, units_on_hand, CATEGORY,price
        from part
        inner join
        WAREHOUSE
        on WAREHOUSE.WarehouseID = part.WAREHOUSEID
        where WAREHOUSE.ManagerID= 25
             */
          }

    }

    private class ViewOrdersActionListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e)
          {
            contentPanel.add(new ViewMyOrdersPanel(dbConnection), "viewMyOrders");
            cl.show(contentPanel, "viewMyOrders");
          }

    }

    private class ModifyPurchaseListener implements ActionListener {

        JFrame parent;

        public ModifyPurchaseListener(JFrame frame)
          {
            parent = frame;
          }

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            //TODO com plete
            contentPanel.add(new ModifyPurchasePanel(dbConnection), "modifyPurchase");
            cl.show(contentPanel, "modifyPurchase");
            System.out.println("showing modify purchase");
          }

    }

    private class AddCustomerListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            System.out.println("clicked add customer");
            contentPanel.add(new AddCustomerPanel(dbConnection), "addCustPanel");

            //  CardLayout cl = (CardLayout) contentPanel.getLayout();
            cl.show(contentPanel, "addCustPanel");
            validate();

          }

    }

    private class ModifyEmployeeListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {

            // new MyAccountModifyFrame(dbConnection);
            new ModifyMyAccountFrame(dbConnection);
            System.out.println("modify employee panel started");
//           
          }

    }

    private class AddSalesOrderListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {

            // new OrderEntry(dbConnection);
            contentPanel.add(new AddOrderGeneratedPanel(dbConnection), "addorder");
            cl.show(contentPanel, "addorder");
            pack();

          }

    }

    private class AddSalesRepListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0)
          {
            contentPanel.add(new AddSalesRepPanel(dbConnection), "addSalesRep");
            cl.show(contentPanel, "addSalesRep");
            // AddSalesRepPanel panel = new AddSalesRepPanel(dbConnection);
            //   add(panel);
            //   validate();

          }

    }

}
