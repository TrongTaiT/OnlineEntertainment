package com.oe.utility;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class XFile {
	private HttpServletRequest request;

	public XFile(HttpServletRequest request) {
		this.request = request;
	}

	// File
	public String save(String paramName, String savingName, String folder) {
		File dir = new File(request.getServletContext().getRealPath(folder));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			Part part = request.getPart(paramName);
			if (part != null && part.getSize() > 0) {
				Part photo = request.getPart(paramName);

				String submittedFileName = photo.getSubmittedFileName();
				String submittedFileExtension = submittedFileName.substring(submittedFileName.lastIndexOf("."));

				File photoFile = new File(dir, savingName + submittedFileExtension);

				// check duplicate fileName?
				for (int i = 0; photoFile.isFile(); i++) {
					photoFile = new File(dir, savingName + "(" + i + ")" + submittedFileExtension);
				}

				photo.write(photoFile.getAbsolutePath());
				return photoFile.getName();
			}
		} catch (FileNotFoundException e) {
			request.setAttribute("message", "Tiêu đề không hợp lệ!");
		} catch (IOException | ServletException e) {
			throw new RuntimeException(e);
		}
		return "";
	}

	public void delete(String fileName, String folder) {
		// delete image in folder
		File dir = new File(request.getServletContext().getRealPath(folder));
		File fileToDelete = new File(dir, fileName);
		if (fileToDelete.isFile()) {
			fileToDelete.delete();
		}
	}

	// Avatar
	public String saveAvatar(String paramName, String email) {
		String savingName = email.substring(0, email.lastIndexOf("@"));
		return this.save(paramName, savingName, "/assets/avatar");
	}

	public void deleteAvatar(String fileName) {
		if (fileName.equals("default_avatar.png")) {
			return; // 
		}
		this.delete(fileName, "/assets/avatar");
	}
	
	// Poster
	public String savePoster(String paramName, String title) {
		String savingName = title.replace(' ', '-');
		return this.save(paramName, savingName, "/assets/poster");
	}
	
	public void deletePoster(String fileName) {
		if (fileName.equals("default_poster.png")) {
			return; // 
		}
		this.delete(fileName, "/assets/poster");
	}
	
//	public static void main(String[] args) {
//		String title = "em chưa 18";
//		System.out.println(formatTitleToFileName(title));
//		System.out.println(formatTitleProperly(title));
//	}
//
//	private static String formatTitleProperly(String title) {
//		String[] titleStringArray = title.split("\\s+");
//		for (String element : titleStringArray) {
//			element = element.substring(0,1).toUpperCase() + element.substring(1).toLowerCase();
//			System.out.println(element);
//		}
//		return String.join(" ", titleStringArray);
//	}
//
//	private static String formatTitleToFileName(String title) {
//		return title.replace(' ', '-');
//	}
}
