package test.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface ProductMapper {

	int insertProduct(ProductDTO product);
}
