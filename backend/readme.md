# Nhiêm cứu RESTful API với Java SpringBoot để xây dựng module backend cho ứng dụng Quản lý Quán Cafe


## Giới thiệu
Dự án Coffee Shop API là một hệ thống quản lý quán cà phê được xây dựng dựa trên Spring Boot, cung cấp các chức năng quản lý sản phẩm, đơn hàng, và nhân viên.

## Công nghệ Sử Dụng
- Spring Boot
- Spring Security
- JPA / Hibernate
- MySQL
- Maven

## Yêu Cầu Hệ Thống
- JDK 11 hoặc mới hơn
- MySQL Server
- Maven 3.6.0 hoặc mới hơn

## Cài Đặt

### Cài đặt môi trường
1. Cài đặt Java Development Kit (JDK): Tải về và cài đặt JDK từ [Oracle's website](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).
2. Cài đặt MySQL Server: Tải về và cài đặt MySQL từ [MySQL's website](https://dev.mysql.com/downloads/mysql/).
3. Cài đặt Maven: Tải về và cài đặt Maven từ [Maven's website](https://maven.apache.org/download.cgi).

### Thiết lập dự án
1. Clone dự án từ repository:
   git clone https://link-to-your-repository.com/coffee-shop-api.git
2. Chuyển vào thư mục dự án:

### Cấu hình Ứng Dụng
Sửa file `src/main/resources/application.properties` để cấu hình kết nối cơ sở dữ liệu và các thông số khác.

```properties
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/coffeeshop
spring.datasource.username=root
spring.datasource.password=yourpassword
```
### Chạy Dự Án
Chạy dự án sử dụng Maven:
```
mvn spring-boot:run
```
### API Documentation
Sau khi dự án khởi động, bạn có thể truy cập tài liệu API tự động được tạo bởi springdoc-openapi tại:
```
http://localhost:8080/swagger-ui.html
```
### Liên Hệ
Người quản lý dự án: Lâm Ngọc Tài
Email: lamngoctai2002@gmail.com
Điện thoại: 0965577180

