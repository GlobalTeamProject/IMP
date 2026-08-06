package test.mapper;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private String product_id;
	private String product_price;
	private String product_name;
	private String product_qty;
	private String product_des;
	private String product_code;
	private String product_picture;
	private MultipartFile file;
	private int memCode;
	private String memId;

	
	public int getMemCode() {
		return memCode;
	}
	public void setMemCode(int memCode) {
		this.memCode = memCode;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getProduct_qty() {
		return product_qty;
	}
	public void setProduct_qty(String product_qty) {
		this.product_qty = product_qty;
	}
	public String getProduct_des() {
		return product_des;
	}
	public void setProduct_des(String product_des) {
		this.product_des = product_des;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	
	
	public String getProduct_picture() {
        return product_picture;
    }
	 public void setProduct_picture(String product_picture) {
	    this.product_picture = product_picture;
	}
	 public MultipartFile getFile() {
	        return file;
    }
    public void setFile(MultipartFile file) {
        this.file = file;
    }
    
	
	
	
	
	
}
