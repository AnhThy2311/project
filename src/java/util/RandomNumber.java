/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Random;

/**
 *
 * @author son
 */
public class RandomNumber {
     public static String RandomNumber() {
		Random rd = new Random();
		String s1 = rd.nextInt(10) + "";
		String s2 = rd.nextInt(10) + "";
		String s3 = rd.nextInt(10) + "";
		String s4 = rd.nextInt(10) + "";
		String s5 = rd.nextInt(10) + "";
		String s6 = rd.nextInt(10) + "";
		String s =  s1+s2+s3+s4+s5+s6;
		return s;
	}
}
