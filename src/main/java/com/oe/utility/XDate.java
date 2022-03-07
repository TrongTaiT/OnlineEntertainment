package com.oe.utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class XDate {

	static SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");

	public static Date now() {
		return new Date();
	}

	public static Date toDate(String dateString) {
		try {
			return fmt.parse(dateString);
		} catch (ParseException e) {
			// huhu
		}
		return null;
	}
	
	public static String toString(Date date) {
		return fmt.format(date) + "";
	}

	public static Date addDays(Date date, long days) {
		date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
		return date;
	}

	public static Date addDays(String dateString, long days) {
		Date date = toDate(dateString);
		date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
		return date;
	}
	
//	public static void main(String[] args) {
//		System.out.println(toDate(toString(now())));
//	}

}