package com.demo.utils;

import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class FileUploadUtility {

	 public static void uploadFile(Part filePart, String uploadPath) throws IOException {
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }

	        String fileName = getFileName(filePart);
	        try (OutputStream out = new FileOutputStream(new File(uploadDir, fileName));
	             InputStream fileContent = filePart.getInputStream()) {
	            byte[] buffer = new byte[1024];
	            int bytesRead;
	            while ((bytesRead = fileContent.read(buffer)) != -1) {
	                out.write(buffer, 0, bytesRead);
	            }
	        }
	    }

	    private static String getFileName(final Part part) {
	        final String partHeader = part.getHeader("content-disposition");
	        for (String content : partHeader.split(";")) {
	            if (content.trim().startsWith("filename")) {
	                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	            }
	        }
	        return null;
	    }
}
