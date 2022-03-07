package com.oe.utility;

import java.security.MessageDigest;

public class HashUtil {

	public static String doHashing(String password) {
		try {
			MessageDigest digs = MessageDigest.getInstance("MD5");
			digs.update(password.getBytes());
			byte[] resultByteArray = digs.digest();
			StringBuilder sb = 	new StringBuilder();
			for(byte b : resultByteArray) {
				sb.append(String.format("%02x", b));
			}
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public static void main(String[] args) {
		System.out.println(doHashing("tetetetete"));
	}
	
}
