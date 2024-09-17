package uz.pdp.config;

import jakarta.servlet.MultipartConfigElement;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "uz.pdp")
@PropertySource(value = "classpath:app.properties")
public class MvcConfigurer implements WebMvcConfigurer {


    @Value("${upload.dir}")
    private  String UPLOAD_DIR;

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver("/WEB-INF/views/", ".jsp");
        viewResolver.setViewClass(JstlView.class);
        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/profilePics/**")
                .addResourceLocations("file:" + UPLOAD_DIR + "/");
    }

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        createUploadDirectory();  // Ensure directory exists
        return new MultipartConfigElement(
                UPLOAD_DIR,  // Temporary directory
                20971520, // Max file size (20 MB)
                41943040, // Max request size (40 MB)
                0         // File size threshold
        );
    }

    @Bean
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }

    private void createUploadDirectory() {
        Path path = Paths.get(UPLOAD_DIR);
        if (!Files.exists(path)) {
            try {
                Files.createDirectories(path);
                System.out.println("Directory created: " + UPLOAD_DIR);
            } catch (IOException e) {
                throw new RuntimeException("Failed to create directory: " + UPLOAD_DIR, e);
            }
        } else {
            System.out.println("Directory already exists: " + UPLOAD_DIR);
        }
    }
}
