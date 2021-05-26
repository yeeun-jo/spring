package com.itbank.member;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	public static String getHash(String pw) {
			
			try {
				MessageDigest md;
				md = MessageDigest.getInstance("SHA-512");
				md.reset();
				md.update(pw.getBytes("UTF-8"));
				String ret = String.format("%0128x", new BigInteger(1, md.digest()));
				return ret;
				
			} catch (NoSuchAlgorithmException e) {
				System.out.println("알고리즘 잘못됨 : "+ e);
			}catch(UnsupportedEncodingException e	) {
				System.out.println("인코딩 잘못됨 : " + e);
			}
			return null;
		}

}
