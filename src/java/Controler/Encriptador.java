/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controler;

import java.security.MessageDigest;


/**
 *
 * @author juaqu
 */
public class Encriptador {
    
    public String encriptarSHA256(String input) {
    try {
        // Crea una instancia de MessageDigest con SHA-256
        MessageDigest digest = MessageDigest.getInstance("SHA-256");

        // Convierte la cadena de entrada a un array de bytes
        byte[] hash = digest.digest(input.getBytes("UTF-8"));

        // Convierte el array de bytes a una cadena hexadecimal
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }

        // Imprime el valor encriptado para depuración
        System.out.println("SHA-256 Encrypted Value: " + hexString.toString());

        return hexString.toString();
    } catch (Exception ex) {
        throw new RuntimeException(ex);
    }
}

}
