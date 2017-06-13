/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilityClasses;

/**
 *
 * @author me
 */
public class Incrementor {

    private static int x = 1112;

    public static int getOrderNum()
      {
        return x++;
      }

}
