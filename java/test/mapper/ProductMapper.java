package test.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface ProductMapper {

	int insertProduct(ProductDTO product);
	List<ProductDTO> selectProduct();
}
