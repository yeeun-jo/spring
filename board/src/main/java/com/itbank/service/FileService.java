package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {

	private final String uploadPath = "D:\\boardFile";
	private String[] extArr = {"jpg","png","jpeg","bmp","gif"};
	
	public FileService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdir();
		}
	}
	
	private boolean isImgFile(String fileName) {
		for(String ext:extArr) {
			if(fileName.toLowerCase().endsWith(ext)) {
				return true;
			}
		}
		return false;
	}

	
	public List<String> getFileList(){
		File dir = new File(uploadPath);
		ArrayList<String> fileList = new ArrayList<String>(Arrays.asList(dir.list()));
		for(int i = 0;i<fileList.size();i++) {
			String fileName = fileList.get(i);
			if(isImgFile(fileName) == false) {
				fileList.remove(i);
			}
		}
		return fileList;
	}
	
	
	public boolean updoladFile(MultipartFile file) throws IllegalStateException, IOException {
		File target = new File(uploadPath, file.getOriginalFilename());
		if(isImgFile(file.getOriginalFilename())) {
			file.transferTo(target);
		}
		return target.exists();
	}

}
