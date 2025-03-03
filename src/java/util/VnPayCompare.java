/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.Collator;
import java.util.Comparator;
import java.util.Locale;

public class VnPayCompare implements Comparator<String> {
    @Override
    public int compare(String x, String y) {
        if (x == null) return -1;
        if (y == null) return 1;
        return Collator.getInstance(Locale.ENGLISH).compare(x, y);
    }
}
