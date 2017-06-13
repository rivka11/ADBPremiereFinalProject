/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilityClasses;

import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author me
 */
public class UtilityClass {

    public static void emptyAllFields(JTextField... texts)
      {
        for (JTextField txt : texts) {
            txt.setText("");
        }
      }

    public static boolean checkEmpty(JTextField... texts)
      {
        for (JTextField txt : texts) {
            if (txt.getText().equals("")) 
            {
                return true;
            }
        }
        return false;
      }
//TODO fix. not realy null
    public static boolean checkNull(JTextField... texts)
      {
          for (JTextField txt : texts) {
            if (txt == null) 
            {
                return true;
            }
        }
        return false;
        
      }
    
    public static void showErrorMessage(String txt ){
        JOptionPane.showMessageDialog(null, txt);
    }

    public static boolean checkEmpty(String...part)
      {
        for(String s : part){
            if(s.equals("")){
                return true;
            }
        }
        return false;
      }

    public static boolean checkNull(Object...stuff)
      {
        for(Object o: stuff){
            if(o==null){
                return true;
            }
        }
        return false;
      }

}
