/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bebet
 */
public class HelperUtil {

    private static final String SESSION_USERNAME = "username";
    private static final String UPLOAD_DIRECTORY = "top1server";
    private static final Logger LOGGER = Logger.getLogger(HelperUtil.class.getName());

    public static String getCurrentUser(HttpServletRequest request)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute(SESSION_USERNAME);
        return username;
    }

    public static String uploadFile(HttpServletRequest request, String getServletRealPath)
            throws ServletException, IOException {

        // Ensure the upload directory exists
        String uploadPath = getServletRealPath + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Process the uploaded image
        Part imagePart = request.getPart("image");
        if (imagePart == null) {
            return "";
        }
        String imageName = imagePart.getSubmittedFileName();
        String imagePath = uploadPath + File.separator + imageName;

        // Save the image file
        try (InputStream imageContent = imagePart.getInputStream(); FileOutputStream fos = new FileOutputStream(imagePath)) {

            byte[] buffer = new byte[1024];
            int bytesRead;

            while ((bytesRead = imageContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        } catch (IOException ex) {
            LOGGER.log(Level.SEVERE, null, ex);
        }
        return request.getContextPath() + File.separator + UPLOAD_DIRECTORY + File.separator + imageName;
    }

}
