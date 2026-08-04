package test.config;

import javax.sql.DataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "test") // 컨트롤러 등 컴포넌트 스캔
@MapperScan(basePackages = "test.mapper") // 마이바티스 매퍼 스캔
public class RootConfig implements WebMvcConfigurer {

    // 1. 오라클 데이터소스
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
        dataSource.setUsername("scott");
        dataSource.setPassword("tigger");
        return dataSource;
    }

    // 2. SqlSessionFactory
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        
        // ★ 현재 파일 구조(webapp/resources/test/mapper)를 정확히 바라보도록 설정
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/test/mapper/*.xml"));
        
        return bean.getObject(); 
    }

    // 3. SqlSessionTemplate
    @Bean
    public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    // 4. JSP 뷰 리졸버
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    // 5. 정적 자원 매핑
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
    // 6. 파일 업로드를 위한 MultipartResolver 빈 등록
    @Bean
    public org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver() {
        org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new org.springframework.web.multipart.commons.CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(10485760); // 최대 파일 크기 (10MB)
        multipartResolver.setMaxUploadSizePerFile(10485760); // 파일당 최대 크기 (10MB)
        multipartResolver.setDefaultEncoding("UTF-8");
        return multipartResolver;
    }
}