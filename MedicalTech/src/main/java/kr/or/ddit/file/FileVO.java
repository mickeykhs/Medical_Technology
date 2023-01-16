package kr.or.ddit.file;

import java.util.Date;

public class FileVO {
	private String fileCd;
	private String filePath;
	private String fileName;
	private String fileType;
	private String fileAtchNo;
	private Date fileDt;
	private String anyCd;
	private int fileSeq;
	private int fileSize;
	
	public FileVO() {}

	public String getFileCd() {
		return fileCd;
	}

	public void setFileCd(String fileCd) {
		this.fileCd = fileCd;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileAtchNo() {
		return fileAtchNo;
	}

	public void setFileAtchNo(String fileAtchNo) {
		this.fileAtchNo = fileAtchNo;
	}

	public Date getFileDt() {
		return fileDt;
	}

	public void setFileDt(Date fileDt) {
		this.fileDt = fileDt;
	}

	public String getAnyCd() {
		return anyCd;
	}

	public void setAnyCd(String anyCd) {
		this.anyCd = anyCd;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	
	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "FileVO [fileCd=" + fileCd + ", filePath=" + filePath + ", fileName=" + fileName + ", fileType="
				+ fileType + ", fileAtchNo=" + fileAtchNo + ", fileDt=" + fileDt + ", anyCd=" + anyCd + ", fileSeq="
				+ fileSeq + ", fileSize=" + fileSize + "]";
	}
}
